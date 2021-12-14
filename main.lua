local delirio = RegisterMod("Delirio",1)
local mod = delirio

local DelirioCurse = Isaac.GetItemIdByName("Delirio's Curse")


local isaacLifeInit = {'r','r','r','','','','','','','','',''}

local magdaleneLifeInit = {'r','r','r','r','','','','','','','',''}

local cainLifeInit = {'r','r','','','','','','','','','',''}

local judasLifeInit = {'r','','','','','','','','','','',''}

local bluebabyLifeInit = {'s','s','s','','','','','','','','',''}

local eveLifeInit = {'r','r','','','','','','','','','',''}

local samsonLifeInit = {'r','r','r','','','','','','','','',''}

local azazelLifeInit = {'b','b','b','','','','','','','','',''}

local lazarusLifeInit = {'r','r','r','','','','','','','','',''}

local edenLifeInit = {'r','r','r','','','','','','','','',''}

local lilithLifeInit = {'r','b','b','','','','','','','','',''}

--Pas sûr
local keeperLifeInit = {'c','c','','','','','','','','','',''}

local apollyonLifeInit = {'r','r','','','','','','','','','',''}

--a voir comment faire pour la double barre de vie (-> stocker pareil en tant que tableau, switch sur le corps, voir comment changer la soul comme ça)
local forgottenLifeInit = {'r','r','','','','','b','','','','',''}

local bethanyLifeInit = {'r','r','r','','','','','','','','',''}

local jacobLifeInit = {'r','r','r','','','','','','','','',''}

local esauLifeInit = {'r','s','','','','','','','','','',''}

local delirioLifeInit = {'r','r','r','','','','','','','','',''}

local isaacLife = isaacLifeInit
local magdaleneLife = magdaleneLifeInit
local cainLife = cainLifeInit
local judasLife = judasLifeInit
local bluebabyLife = bluebabyLifeInit
local eveLife = eveLifeInit
local samsonLife = samsonLifeInit
local azazelLife = azazelLifeInit
local lazarusLife = lazarusLifeInit
local edenLife = edenLifeInit
local lilithLife = lilithLifeInit
local keeperLife = keeperLifeInit
local apollyonLife = apollyonLifeInit
local forgottenLife = forgottenLifeInit
local bethanyLife = bethanyLifeInit
local jacobLife = jacobLifeInit
local esauLife = esauLifeInit
local delirioLife = delirioLifeInit

function mod:LifeInit(IsContinued)
    if Game.GetFrameCount() == 0 then
        isaacLife = isaacLifeInit
        magdaleneLife = magdaleneLifeInit
        cainLife = cainLifeInit
        judasLife = judasLifeInit
        bluebabyLife = bluebabyLifeInit
        eveLife = eveLifeInit
        samsonLife = samsonLifeInit
        azazelLife = azazelLifeInit
        lazarusLife = lazarusLifeInit
        edenLife = edenLifeInit
        lilithLife = lilithLifeInit
        keeperLife = keeperLifeInit
        apollyonLife = apollyonLifeInit
        forgottenLife = forgottenLifeInit
        bethanyLife = bethanyLifeInit
        jacobLife = jacobLifeInit
        esauLife = esauLifeInit
        delirioLife = delirioLifeInit
    end
end
mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, mod.LifeInit)


function mod:UseDelirioCurse(delirioCurse, rng, player, flags, slot, data)
	local num = rng:RandomInt(19)
	player:ChangePlayerType(num)
end
mod:AddCallback(ModCallbacks.MC_USE_ITEM, mod.UseDelirioCurse, DelirioCurse)


function mod:UseUnchargedCurse()
    local player = Isaac.GetPlayer(0)
    local slot = -1
    local action = -1
    if player:HasCollectible(DelirioCurse) then
        if player:GetActiveItem(ActiveSlot.SLOT_PRIMARY) == DelirioCurse then     --add things for other slots (secondary + pocket)
            slot = ActiveSlot.SLOT_PRIMARY
            action = ButtonAction.ACTION_ITEM
        end

        if player:GetActiveItem(ActiveSlot.SLOT_POCKET) == DelirioCurse then
            slot = ActiveSlot.SLOT_POCKET
            action = ButtonAction.ACTION_PILLCARD
        end

        if not (slot == ActiveSlot.SLOT_SECONDARY or Game.IsPaused()) then
            if player:GetActiveCharge(slot) > 1 and Input.IsActionPressed(action, 0) then
                player:UseActiveItem(DelirioCurse,0,-1)
                player:DischargeActiveItem(slot)
            end
        end
    end
end
mod:AddCallback(ModCallbacks.MC_POST_RENDER, mod.UseUnchargedCurse)


function mod:OverchargedCheck(RNG,pos)
    local player = Isaac.GetPlayer(0)
    local slot = -1
    if player:HasCollectible(DelirioCurse) then
        if player:GetActiveItem(ActiveSlot.SLOT_PRIMARY) == DelirioCurse then     --add things for other slots (secondary + pocket)
            slot = ActiveSlot.SLOT_PRIMARY
        end

        if player:GetActiveItem(ActiveSlot.SLOT_SECONDARY) == DelirioCurse then
            slot = ActiveSlot.SLOT_SECONDARY
        end

        if player:GetActiveItem(ActiveSlot.SLOT_POCKET) == DelirioCurse then
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
	if player:HasCollectible(DelirioCurse) then
		if wisp.SubType == DelirioCurse then
			wisp.SubType = 482
		end
	end
end
mod:AddCallback(ModCallbacks.MC_FAMILIAR_INIT, mod.DefaultWispInit, FamiliarVariant.WISP)


function mod:CacheUpdate(player, CacheFlag)
    local player = Isaac.GetPlayer(0)
    if player:HasCollectible(DelirioCurse) then
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