require "main-utils"

-- Saves the mod in a variable
local delirio = RegisterMod("Delirio",1)
local mod = delirio

-- Saves the item in a variable
local DelirioCurse = Isaac.GetItemIdByName("Delirio's Curse")

-- Variables used in main functions
local itemUsed = false

---@TODO
-- Those should be tables with one per player
-- Here have a DelirioLife per DelirioClicker user
local delirioLife = { DelirioLife:new(), DelirioLife:new(), DelirioLife:new(), DelirioLife:new() }
-- Here have a curse per character
local cursedByDelirio = { false, false, false, false }

---@TODO Here restore DelirioLife if isContinued
---Initialize all variables for the game start
---@param isContinued boolean
function mod:GameInit(isContinued)
    delirioLife = { DelirioLife:new(), DelirioLife:new(), DelirioLife:new(), DelirioLife:new() }
    local player = Isaac.GetPlayer(0)
    cursedByDelirio[1] = player:GetName() == "Delirio"
end
mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, mod.GameInit)

---Does the Delirio initialization (give active item and eternal heart)
---@param player EntityPlayer
function mod:DelirioInit(player)
    if player:GetName() == "Delirio" then
        player:AddCollectible(DelirioCurse)
        player:AddEternalHearts(1)
    end
end
mod:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT , mod.DelirioInit)

---Activates the item "Delirio's Curse"
---@param delirioCurse CollectibleType
---@param rng RNG
---@param player EntityPlayer
function mod:UseDelirioCurse(delirioCurse, rng, player)
	local num = rng:RandomInt(17) -- Character number [0; 17[
    local nextPlayerType = ChosePlayerFromInt(num)

    delirioLife[1]:StoreLife(player)
    RemoveCharacterItem(player)

    player:ChangePlayerType(nextPlayerType)
    delirioLife[1]:LoadLife(player, nextPlayerType)
    AddCharacterItem(player)

    itemUsed = true
end
mod:AddCallback(ModCallbacks.MC_USE_ITEM, mod.UseDelirioCurse, DelirioCurse)

---Allows the player to use the item while partially charged (minimum 2 charges)
---Calls UseDelirioCurse function
function mod:UseUnchargedCurse()
    local player = Isaac.GetPlayer(0)
    local slot = nil
    local action = -1

    if itemUsed then
        itemUsed = false
        return
    end

    if player:HasCollectible(DelirioCurse) then
        if player:GetActiveItem(ActiveSlot.SLOT_PRIMARY) == DelirioCurse then
            slot = ActiveSlot.SLOT_PRIMARY
            action = ButtonAction.ACTION_ITEM
        end

        if player:GetActiveItem(ActiveSlot.SLOT_POCKET) == DelirioCurse then
            slot = ActiveSlot.SLOT_POCKET
            action = ButtonAction.ACTION_PILLCARD
        end

        if not (slot == nil or Game():IsPaused()) then
            if player:GetActiveCharge(slot) > 1 and Input.IsActionTriggered(action, 0) then
                player:UseActiveItem(DelirioCurse)
                player:DischargeActiveItem(slot)
            end
        end
    end
end
mod:AddCallback(ModCallbacks.MC_POST_RENDER, mod.UseUnchargedCurse)

---Damages the player if he has the full charged item and clears a room
function mod:OverchargedCheck(_, _)
    local player = Isaac.GetPlayer(0)
    local slot = nil
    if player:HasCollectible(DelirioCurse) then
        if player:GetActiveItem(ActiveSlot.SLOT_PRIMARY) == DelirioCurse then
            slot = ActiveSlot.SLOT_PRIMARY
        end

        if player:GetActiveItem(ActiveSlot.SLOT_SECONDARY) == DelirioCurse then
            slot = ActiveSlot.SLOT_SECONDARY
        end

        if player:GetActiveItem(ActiveSlot.SLOT_POCKET) == DelirioCurse then
            slot = ActiveSlot.SLOT_POCKET
        end

        if player:GetActiveItem(ActiveSlot.SLOT_POCKET2) == DelirioCurse then
            slot = ActiveSlot.SLOT_POCKET2
        end

        if player:GetActiveCharge(slot) >= 6 then
            player:TakeDamage(1,0,EntityRef(player),0)
        end
    end
end
mod:AddCallback(ModCallbacks.MC_PRE_SPAWN_CLEAN_AWARD, mod.OverchargedCheck)

---Prevents the player from picking up any other active item
---@param pickup EntityPickup
---@param collider table [Entity]
---@return boolean? (true => ignore collision; false => collide but not execute internal code; nil => continue as expected)
function mod:ActiveItemsCurse(pickup, collider, _)
	if not collider:ToPlayer() then
        return
    end

    if pickup.Variant == PickupVariant.PICKUP_COLLECTIBLE then
        local item = Isaac.GetItemConfig():GetCollectible(pickup.SubType)
        local isActive = item.Type == ItemType.ITEM_ACTIVE

        if cursedByDelirio[1] and isActive then
            return false
        end

        cursedByDelirio[1] = cursedByDelirio[1] or DelirioCurse == pickup.SubType
    end
end
mod:AddCallback(ModCallbacks.MC_PRE_PICKUP_COLLISION, mod.ActiveItemsCurse)

--[[
--whisp implememtation (book of virtues)
function mod:DefaultWispInit(wisp)
	if player:HasCollectible(DelirioCurse) then
		if wisp.SubType == DelirioCurse then
			wisp.SubType = 482
		end
	end
end
mod:AddCallback(ModCallbacks.MC_FAMILIAR_INIT, mod.DefaultWispInit, FamiliarVariant.WISP)
]]