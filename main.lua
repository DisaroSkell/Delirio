local delirio = RegisterMod("Delirio",1)
local mod = delirio

local DelirioClicker = Isaac.GetItemIdByName("Delirio's Clicker")


function mod:UseClickerV2(clickerV2, rng, player, flags, slot, data)            
	local num = rng:RandomInt(19)
	player:ChangePlayerType(num)
end
mod:AddCallback(ModCallbacks.MC_USE_ITEM, mod.UseClickerV2, DelirioClicker)


function mod:UseClickerV3()
    local player = Isaac.GetPlayer(0)
    local slot = -1
    local action = -1
    if player:HasCollectible(DelirioClicker) then
        if player:GetActiveItem(ActiveSlot.SLOT_PRIMARY) == DelirioClicker then     --add things for other slots (secondary + pocket)
            slot = ActiveSlot.SLOT_PRIMARY
            action = ButtonAction.ACTION_ITEM
        end

        if player:GetActiveItem(ActiveSlot.SLOT_POCKET) == DelirioClicker then
            slot = ActiveSlot.SLOT_POCKET
            action = ButtonAction.ACTION_PILLCARD
        end

        if not (slot == ActiveSlot.SLOT_SECONDARY or Game.IsPaused()) then
            if player:GetActiveCharge(slot) > 1 and Input.IsActionPressed(action, 0) then
                player:UseActiveItem(DelirioClicker,0,-1)
                player:DischargeActiveItem(slot)
            end
        end
    end
end
mod:AddCallback(ModCallbacks.MC_POST_RENDER, mod.UseClickerV3)


function mod:OverchargedCheck(RNG,pos)
    local player = Isaac.GetPlayer(0)
    local slot = -1
    if player:HasCollectible(DelirioClicker) then
        if player:GetActiveItem(ActiveSlot.SLOT_PRIMARY) == DelirioClicker then     --add things for other slots (secondary + pocket)
            slot = ActiveSlot.SLOT_PRIMARY
        end

        if player:GetActiveItem(ActiveSlot.SLOT_SECONDARY) == DelirioClicker then
            slot = ActiveSlot.SLOT_SECONDARY
        end

        if player:GetActiveItem(ActiveSlot.SLOT_POCKET) == DelirioClicker then
            slot = ActiveSlot.SLOT_POCKET
        end

        if player:GetActiveCharge(slot) == 6 then
            player:TakeDamage(1,0,EntityRef(player),0)
        end
    end
end
mod:AddCallback(ModCallbacks.MC_PRE_SPAWN_CLEAN_AWARD, mod.OverchargedCheck)

--[[
function mod:DefaultWispInit(wisp)                      --whisp implememtation (book of virtues)
	if player:HasCollectible(DelirioClicker) then
		if wisp.SubType == DelirioClicker then
			wisp.SubType = 482
		end
	end
end
mod:AddCallback(ModCallbacks.MC_FAMILIAR_INIT, mod.DefaultWispInit, FamiliarVariant.WISP)


function mod:CacheUpdate(player, CacheFlag)
    local player = Isaac.GetPlayer(0)
    if player:HasCollectible(DelirioClicker) then
        if cacheFlag == CacheFlag.CACHE_DAMAGE then
            player.Damage = player.Damage +1;
        end
        if cacheFlag == CacheFlag.CACHE_SPEED then
            player.MoveSpeed = player.MoveSpeed +1;
        end
    end
end

mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, mod.CacheUpdate)

Peut-être que je change le perso en Delirio au ramassage de l'objet, à voir
]]