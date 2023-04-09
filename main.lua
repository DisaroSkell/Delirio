require "main-utils"

-- Saves the mod in a variable
local delirio = RegisterMod("Delirio",1)
local mod = delirio

-- Saves the item in a variable
local DelirioCurse = Isaac.GetItemIdByName("Delirio's Curse")

local itemUsed = false
local cursedByDelirio = false

-- Does the Delirio initialization (give active item and eternal heart)
function mod:delirioInit(player)
    cursedByDelirio = false

    if player:GetName() == "Delirio" then
        player:AddCollectible(DelirioCurse)
        cursedByDelirio = true
        player:AddEternalHearts(1)
    end

    LifeInit()
end
mod:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT , mod.delirioInit)

-- Activates the item "Delirio's Curse"
function mod:UseDelirioCurse(delirioCurse, rng, player)
	local num = rng:RandomInt(17) -- Character number [0; 17[
    local nextPlayerType = ChosePlayerFromInt(num)

    StoreLife(player)
    RemoveCharacterItem(player)

    player:ChangePlayerType(nextPlayerType)
    LoadLife(player, nextPlayerType)
    AddCharacterItem(player)

    itemUsed = true
end
mod:AddCallback(ModCallbacks.MC_USE_ITEM, mod.UseDelirioCurse, DelirioCurse)

-- Calls UseDelirioCurse function
-- Allows the player to use the item while partially charged (minimum 2 charges)
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

-- Damages the player if he has the full charged item and clears a room
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

-- Prevents the player from picking up any other active item
function mod:ActiveItemsCurse(pickup, collider, _)
	if not collider:ToPlayer() then
        return
    end

    if pickup.Variant == PickupVariant.PICKUP_COLLECTIBLE then
        local item = Isaac.GetItemConfig():GetCollectible(pickup.SubType)
        local isActive = item.Type == ItemType.ITEM_ACTIVE

        if cursedByDelirio and isActive then
            return false
        end

        cursedByDelirio = cursedByDelirio or DelirioCurse == pickup.SubType
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