--Saves the mod in a variable
local delirio = RegisterMod("Delirio",1)
local mod = delirio

--Saves the item in a variable
local DelirioCurse = Isaac.GetItemIdByName("Delirio's Curse")


--Variables for initial character lives
local isaacLifeInit = {'r','r','r','','','','','','','','',''}

local magdaleneLifeInit = {'r','r','r','r','','','','','','','',''}

local cainLifeInit = {'r','r','','','','','','','','','',''}

local judasLifeInit = {'r','','','','','','','','','','',''}

local bluebabyLifeInit = {'s','s','s','','','','','','','','',''}

local eveLifeInit = {'r','r','','','','','','','','','',''}

local samsonLifeInit = {'r','r','r','','','','','','','','',''}

local azazelLifeInit = {'b','b','b','','','','','','','','',''}

local lazarusLifeInit = {'r','r','r','','','','','','','','',''}

--À revoir
local edenLifeInit = {'r','r','r','','','','','','','','',''}

local lilithLifeInit = {'r','b','b','','','','','','','','',''}

--Pas sûr
local keeperLifeInit = {'c','c','','','','','','','','','',''}

local apollyonLifeInit = {'r','r','','','','','','','','','',''}

--À voir comment faire pour la double barre de vie (-> stocker pareil en tant que tableau, switch sur le corps, voir comment changer la soul comme ça)
local forgottenLifeInit = {'r','r','','','','','b','','','','',''}

local bethanyLifeInit = {'r','r','r','','','','','','','','',''}

local jacobLifeInit = {'r','r','r','','','','','','','','',''}

local esauLifeInit = {'r','s','','','','','','','','','',''}

local delirioLifeInit = {'r','r','r','','','','','','','','',''}

--[[Don't know if that's necessary:
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
]]

--Variable that checks if Lazarus has died or not
local isLazDead = False

--Reinitialize the variable for every game start
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

        isLazDead = False
    end
end
mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, mod.LifeInit)


--Life storage here, remember to store if Laz has died
function mod:storeLife()
    local player = Isaac.GetPlayer(0).GetPlayerType()
    if player == PlayerType.PLAYER_ISAAC then                   --Isaac
        --LifePickupCheck
        --HurtCheck
        --StoreLife

    elseif player == PlayerType.PLAYER_MAGDALENA then           --Magdalene
        --LifePickupCheck
        --HurtCheck
        --StoreLife

    elseif player == PlayerType.PLAYER_CAIN then                --Cain
        --LifePickupCheck
        --HurtCheck
        --StoreLife

    elseif player == PlayerType.PLAYER_JUDAS then               --Judas
        --LifePickupCheck
        --HurtCheck
        --StoreLife

    elseif player == PlayerType.PLAYER_XXX then                 --BlueBaby
        --LifePickupCheck
        --HurtCheck
        --StoreLife

    elseif player == PlayerType.PLAYER_EVE then                 --Eve
        --LifePickupCheck
        --HurtCheck
        --StoreLife

    elseif player == PlayerType.PLAYER_SAMSON then              --Samson
        --LifePickupCheck
        --HurtCheck
        --StoreLife

    elseif player == PlayerType.PLAYER_AZAZEL then              --Azazel
        --LifePickupCheck
        --HurtCheck
        --StoreLife

    elseif (player == PlayerType.PLAYER_LAZARUS) or (player == PlayerType.PLAYER_LAZARUS2) then    --Lazarus
        --LifePickupCheck
        --HurtCheck
        --StoreLife

    elseif player == PlayerType.PLAYER_EDEN then                --Eden
        --LifePickupCheck
        --HurtCheck
        --StoreLife

    elseif player == PlayerType.PLAYER_THELOST then             --The Lost
        --Nothing to be done ?? Maybe holymantle check

    elseif player == PlayerType.PLAYER_LILITH then              --Lilith
        --LifePickupCheck
        --HurtCheck
        --StoreLife
        
    elseif player == PlayerType.PLAYER_KEEPER then              --Keeper
        --LifePickupCheck
        --HurtCheck
        --StoreLife

    elseif player == PlayerType.PLAYER_APOLLYON then            --Apollyon
        --LifePickupCheck
        --HurtCheck
        --StoreLife

    elseif player == PlayerType.PLAYER_THEFORGOTTEN then        --The Forgotten
        --LifePickupCheck
        --HurtCheck
        --StoreLife

    elseif player == PlayerType.PLAYER_THESOUL then             --The Soul
        --LifePickupCheck
        --HurtCheck
        --StoreLife

    elseif player == PlayerType.PLAYER_BETHANY then             --Bethany
        --LifePickupCheck
        --HurtCheck
        --StoreLife
    elseif player == PlayerType.PLAYER_JACOB then               --Jacob
        --LifePickupCheck
        --HurtCheck
        --StoreLife

    elseif player == PlayerType.PLAYER_ESAU then                --Esau
        --LifePickupCheck
        --HurtCheck
        --StoreLife

    else                                                        --Delirio
        --LifePickupCheck
        --HurtCheck
        --StoreLife

mod:AddCallback(ModCallbacks.MC_POST_RENDER, mod.storeLife)
--Maybe split in two with callback: one at dmg and one at heart pickup


--Activates the item "Delirio's Curse" which makes the character change himself into another character
function mod:UseDelirioCurse(delirioCurse, rng, player, flags, slot, data)
	local num = rng:RandomInt(18)

    if num == 1 then        --Isaac
        player:ChangePlayerType(PlayerType.PLAYER_ISAAC)
        --LoadLife
        --Change Active Item form

    elseif num == 2 then    --Magdalene
        player:ChangePlayerType(PlayerType.PLAYER_MAGDALENA)
        --LoadLife
        --Change Active Item form

    elseif num == 3 then    --Cain
        player:ChangePlayerType(PlayerType.PLAYER_CAIN)
        --LoadLife
        --Change Active Item form

    elseif num == 4 then    --Judas
        player:ChangePlayerType(PlayerType.PLAYER_JUDAS)
        --LoadLife
        --Change Active Item form

    elseif num == 5 then    --BlueBaby
        player:ChangePlayerType(PlayerType.PLAYER_XXX)
        --LoadLife
        --Change Active Item form

    elseif num == 6 then    --Eve
        player:ChangePlayerType(PlayerType.PLAYER_EVE)
        --LoadLife
        --Change Active Item form

    elseif num == 7 then    --Samson
        player:ChangePlayerType(PlayerType.PLAYER_SAMSON)
        --LoadLife
        --Change Active Item form

    elseif num == 8 then    --Azazel
        player:ChangePlayerType(PlayerType.PLAYER_AZAZEL)
        --LoadLife
        --Change Active Item form

    elseif num == 9 then    --Lazarus
        if isLazDead then   --Lazarus Risen
            player:ChangePlayerType(PlayerType.PLAYER_LAZARUS2)
            --LoadLife
            --Change Active Item form

        else                --Lazarus (the real one)
            player:ChangePlayerType(PlayerType.PLAYER_LAZARUS)
            --LoadLife
            --Change Active Item form

    elseif num == 10 then   --Eden
        player:ChangePlayerType(PlayerType.PLAYER_EDEN)
        --LoadLife
        --Change Active Item form

    elseif num == 11 then   --The Lost
        player:ChangePlayerType(PlayerType.PLAYER_THELOST)
        --No life to load
        --Change Active Item form

    elseif num == 12 then   --Lilith
        player:ChangePlayerType(PlayerType.PLAYER_LILITH)
        --LoadLife
        --Change Active Item form
        
    elseif num == 13 then   --Keeper
        player:ChangePlayerType(PlayerType.PLAYER_KEEPER)
        --LoadLife
        --Change Active Item form

    elseif num == 14 then   --Apollyon
        player:ChangePlayerType(PlayerType.PLAYER_APOLLYON)
        --LoadLife
        --Change Active Item form

    elseif num == 15 then   --The Forgotten
        player:ChangePlayerType(PlayerType.PLAYER_THEFORGOTTEN)
        --LoadLife (may be harder here)
        --Change Active Item form

    elseif num == 16 then   --Bethany
        player:ChangePlayerType(PlayerType.PLAYER_BETHANY)
        --LoadLife
        --Change Active Item form

    elseif num == 17 then   --Jacob (& Esau)
        player:ChangePlayerType(PlayerType.PLAYER_JACOB)
        --LoadLife
        --LoadLife for Esau
        --Change Active Item form

    else                    --Delirio
        player:ChangePlayerType(PlayerType.PLAYER_DELIRIO) --Rajouter Delirio à l'enum (Je sais pas si ça marche ni comment on fait)
        --LoadLife
        --Change Active Item form

end
mod:AddCallback(ModCallbacks.MC_USE_ITEM, mod.UseDelirioCurse, DelirioCurse)


--Calls the previous functions, should be fine as it is
--Allows the player to use the item while partially charged (minimum 2 charges)
function mod:UseUnchargedCurse()
    local player = Isaac.GetPlayer(0)
    local slot = -1
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

        if not (slot == ActiveSlot.SLOT_SECONDARY or Game.IsPaused()) then
            if player:GetActiveCharge(slot) > 1 and Input.IsActionPressed(action, 0) then
                player:UseActiveItem(DelirioCurse,0,-1)
                player:DischargeActiveItem(slot)
            end
        end
    end
end
mod:AddCallback(ModCallbacks.MC_POST_RENDER, mod.UseUnchargedCurse)


--Damages the player if he has the full charged item and clears a room
function mod:OverchargedCheck(RNG,pos)
    local player = Isaac.GetPlayer(0)
    local slot = -1
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


--Modify this to make player get stats by collecting the item
--Idea: the item transforms the character into Delirio
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
]]