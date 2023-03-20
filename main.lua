-- Saves the mod in a variable
local delirio = RegisterMod("Delirio",1)
local mod = delirio

-- Saves the item in a variable
local DelirioCurse = Isaac.GetItemIdByName("Delirio's Curse")

-- Give Delirio his curse when game starts
function mod:addCurseToDelirio(player)
    if player:GetName() == "Delirio" then
        player:AddCollectible(DelirioCurse)
    end
end
mod:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT , mod.addCurseToDelirio)

-- Activates the item "Delirio's Curse"
function mod:UseDelirioCurse(delirioCurse, rng, player)
	local num = rng:RandomInt(17) -- Character number [0; 17[

    -- storeLife(player, num)

    if num == 0 then        --Isaac
        player:ChangePlayerType(PlayerType.PLAYER_ISAAC)

    elseif num == 1 then    --Magdalene
        player:ChangePlayerType(PlayerType.PLAYER_MAGDALENA)

    elseif num == 2 then    --Cain
        player:ChangePlayerType(PlayerType.PLAYER_CAIN)

    elseif num == 3 then    --Judas
        player:ChangePlayerType(PlayerType.PLAYER_JUDAS)

    elseif num == 4 then    --BlueBaby
        player:ChangePlayerType(PlayerType.PLAYER_XXX)

    elseif num == 5 then    --Eve
        player:ChangePlayerType(PlayerType.PLAYER_EVE)

    elseif num == 6 then    --Samson
        player:ChangePlayerType(PlayerType.PLAYER_SAMSON)

    elseif num == 7 then    --Azazel
        player:ChangePlayerType(PlayerType.PLAYER_AZAZEL)

    elseif num == 8 then    --Lazarus
        player:ChangePlayerType(PlayerType.PLAYER_LAZARUS)

    elseif num == 9 then    --Eden
        player:ChangePlayerType(PlayerType.PLAYER_EDEN)

    elseif num == 10 then   --The Lost
        player:ChangePlayerType(PlayerType.PLAYER_THELOST)

    elseif num == 11 then   --Lilith
        player:ChangePlayerType(PlayerType.PLAYER_LILITH)

    elseif num == 12 then   --Keeper
        player:ChangePlayerType(PlayerType.PLAYER_KEEPER)

    elseif num == 13 then   --Apollyon
        player:ChangePlayerType(PlayerType.PLAYER_APOLLYON)

    elseif num == 14 then   --The Forgotten
        player:ChangePlayerType(PlayerType.PLAYER_THEFORGOTTEN)

    elseif num == 15 then   --Bethany
        player:ChangePlayerType(PlayerType.PLAYER_BETHANY)

    elseif num == 16 then   --Jacob (& Esau)
        player:ChangePlayerType(PlayerType.PLAYER_JACOB)
        -- Do some Esau BS

    end

    -- loadLife(num)
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
                player:DischargeActiveItem(slot)
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

        if player:GetActiveCharge(slot) == 6 then
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