-- For now this file is useless

-- Variables for initial character lives (boolean for eternal heart, int for golden hearts count)
-- First letter: f = full, h = half, e = empty, r = rotten
-- Second letter: r = red, s = soul, d = dark (black), b = bone
local isaacLifeInit = {'fr','fr','fr','','','','','','','','','', false, 0}

local magdaleneLifeInit = {'fr','fr','fr','fr','','','','','','','','', false, 0}

local cainLifeInit = {'fr','fr','','','','','','','','','','', false, 0}

local judasLifeInit = {'fr','','','','','','','','','','','', false, 0}

local bluebabyLifeInit = {'s','s','s','','','','','','','','','', false, 0}

local eveLifeInit = {'fr','fr','','','','','','','','','','', false, 0}

local samsonLifeInit = {'fr','fr','fr','','','','','','','','','', false, 0}

local azazelLifeInit = {'b','b','b','','','','','','','','','', false, 0}

local lazarusLifeInit = {'fr','fr','fr','','','','','','','','','', false, 0}

-- Eden is random

local lilithLifeInit = {'fr','b','b','','','','','','','','','', false, 0}

-- Maxlife, Currentlife
local keeperLifeInit = {3,3}

local apollyonLifeInit = {'fr','fr','','','','','','','','','','', false, 0}

local forgottenLifeInit = {'fb','fb','','','','','b','','','','','', false, 0}

local bethanyLifeInit = {'fr','fr','fr','','','','','','','','','', false, 0}

local jacobLifeInit = {'fr','fr','fr','','','','','','','','','', false, 0}

local esauLifeInit = {'fr','s','','','','','','','','','','', false, 0}

local delirioLifeInit = {'fr','hb','','','','','','','','','','', true, 0}

local isaacLife
local magdaleneLife
local cainLife
local judasLife
local bluebabyLife
local eveLife
local samsonLife
local azazelLife
local lazarusLife
local edenLife
local lilithLife
local keeperLife
local apollyonLife
local forgottenLife
local bethanyLife
local jacobLife
local esauLife
local delirioLife

-- Life storage here
local function storeLife(player, playerNum)
    local eternal = player:GetEternalHearts() > 0
    local golden = player:GetGoldenHearts()

    if playerNum == 0 then      --Isaac
        --StoreLife

    elseif playerNum == 1 then      --Magdalene
        --StoreLife

    elseif playerNum == 2 then      --Cain
        --StoreLife

    elseif playerNum == 3 then      --Judas
        --StoreLife

    elseif playerNum == 4 then      --BlueBaby
        --StoreLife

    elseif playerNum == 5 then      --Eve
        --StoreLife

    elseif playerNum == 6 then      --Samson
        --StoreLife

    elseif playerNum == 7 then      --Azazel
        --StoreLife

    elseif playerNum == 8 then      --Lazarus
        --StoreLife

    elseif playerNum == 9 then      --Eden
        --StoreLife

    elseif playerNum == 10 then     --The Lost
        --Nothing to be done ?? Maybe holymantle check

    elseif playerNum == 11 then     --Lilith
        --StoreLife
        
    elseif playerNum == 12 then     --Keeper
        --StoreLife

    elseif playerNum == 13 then     --Apollyon
        --StoreLife

    elseif playerNum == 14 then     --The Forgotten
        --StoreLife

    elseif playerNum == 15 then     --The Soul
        --StoreLife

    elseif playerNum == 15 then     --Bethany
        --StoreLife

    elseif playerNum == 16 then     --Jacob & Esau
        --StoreLife

    else                            --Delirio
        --StoreLife
    end
end

-- (Re)initialize the variable for every game start
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
        --edenLife = random
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