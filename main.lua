require "utils"

-- Saves the mod in a variable
local delirio = RegisterMod("Delirio",1)
local mod = delirio

-- Saves the item in a variable
local DelirioCurse = Isaac.GetItemIdByName("Delirio's Curse")

-- Does the Delirio initialization (give active item and eternal heart)
function mod:delirioInit(player)
    if player:GetName() == "Delirio" then
        player:AddCollectible(DelirioCurse)
        player:AddEternalHearts(1)
    end

    LifeInit()
end
mod:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT , mod.delirioInit)

-- Activates the item "Delirio's Curse"
function mod:UseDelirioCurse(delirioCurse, rng, player)
	local num = rng:RandomInt(17) -- Character number [0; 17[
    local nextPlayerType = PlayerType.PLAYER_POSSESSOR

    StoreLife(player)

    if num == 0 then        --Isaac
        nextPlayerType = PlayerType.PLAYER_ISAAC

    elseif num == 1 then    --Magdalene
        nextPlayerType = PlayerType.PLAYER_MAGDALENA

    elseif num == 2 then    --Cain
        nextPlayerType = PlayerType.PLAYER_CAIN

    elseif num == 3 then    --Judas
        nextPlayerType = PlayerType.PLAYER_JUDAS

    elseif num == 4 then    --BlueBaby
        nextPlayerType = PlayerType.PLAYER_XXX

    elseif num == 5 then    --Eve
        nextPlayerType = PlayerType.PLAYER_EVE

    elseif num == 6 then    --Samson
        nextPlayerType = PlayerType.PLAYER_SAMSON

    elseif num == 7 then    --Azazel
        nextPlayerType = PlayerType.PLAYER_AZAZEL

    elseif num == 8 then    --Lazarus
        nextPlayerType = PlayerType.PLAYER_LAZARUS

    elseif num == 9 then    --Eden
        nextPlayerType = PlayerType.PLAYER_EDEN

    elseif num == 10 then   --The Lost
        nextPlayerType = PlayerType.PLAYER_THELOST

    elseif num == 11 then   --Lilith
        nextPlayerType = PlayerType.PLAYER_LILITH

    elseif num == 12 then   --Keeper
        nextPlayerType = PlayerType.PLAYER_KEEPER

    elseif num == 13 then   --Apollyon
        nextPlayerType = PlayerType.PLAYER_APOLLYON

    elseif num == 14 then   --The Forgotten
        nextPlayerType = PlayerType.PLAYER_THEFORGOTTEN

    elseif num == 15 then   --Bethany
        nextPlayerType = PlayerType.PLAYER_BETHANY

    elseif num == 16 then   --Jacob (& Esau)
        nextPlayerType = PlayerType.PLAYER_JACOB
        -- Do some Esau BS (Maybe)
    end

    player:ChangePlayerType(nextPlayerType)
    LoadLife(player, nextPlayerType)
    -- changeActive()
end
mod:AddCallback(ModCallbacks.MC_USE_ITEM, mod.UseDelirioCurse, DelirioCurse)

-- Calls UseDelirioCurse function
-- Allows the player to use the item while partially charged (minimum 2 charges)
function mod:UseUnchargedCurse()
    local player = Isaac.GetPlayer(0)
    local slot = nil
    local action = -1
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
            if player:GetActiveCharge(slot) > 1 and Input.IsActionPressed(action, 0) then
                player:UseActiveItem(DelirioCurse)
                player:SetActiveCharge(player:GetBatteryCharge(slot), slot)
            end
        end
    end
end
mod:AddCallback(ModCallbacks.MC_POST_RENDER, mod.UseUnchargedCurse)

-- Damages the player if he has the full charged item and clears a room
function mod:OverchargedCheck(RNG,pos)
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