require "script.DelirioLife"

local Delirio = {}

-- (Re)initialize the variables for every game start
function LifeInit()
    Delirio = DelirioLife:new()
end

---Life storage here
---@param player EntityPlayer
function StoreLife(player)
    local life = LifeBar.newFromPlayer(player)

    if player:GetName() == "Delirio" then
        Delirio:ChangeDelirioLife(life)
    else
        Delirio:ChangeLife(player:GetPlayerType(), life)
    end
end

---Life loading there
---@param player EntityPlayer
---@param nextPlayerType PlayerType
function LoadLife(player, nextPlayerType)
    local currentLife = LifeBar.newFromPlayer(player)
    local goalLife = {}

    if player:GetName() == "Delirio" then
        goalLife = Delirio:GetDelirioLife()
    else
        goalLife = Delirio:GetLife(nextPlayerType)
    end

    local diff = goalLife:Diff(currentLife)

    player:AddBrokenHearts(diff:GetHeartCount(HeartType.BROKEN))
    player:AddMaxHearts(diff:GetHeartCount(HeartType.CONTAINER))
    player:AddBoneHearts(diff:GetHeartCount(HeartType.BONE))
    player:AddSoulHearts(diff:GetHeartCount(HeartType.SOUL))
    player:AddEternalHearts(diff:GetHeartCount(HeartType.ETERNAL))
    player:AddGoldenHearts(diff:GetHeartCount(HeartType.GOLDEN))

    -- Because containers moved, the diff isn't accurate here.
    player:AddHearts(goalLife:GetHeartCount(HeartType.RED) - player:GetHearts())

    -- Black hearts being counted by as soul hearts, the diff isn't accurate here either.
    player:AddBlackHearts(goalLife:GetHeartCount(HeartType.BLACK) - player:GetBlackHearts())
end

---Converts the int into PlayerType enum
---0 is Isaac, 1 is Maggy... 16 is Jacob&Esau
---@param n integer
---@return PlayerType
function ChosePlayerFromInt(n)
    local result = PlayerType.PLAYER_POSSESSOR

    if n == 0 then        --Isaac
        result = PlayerType.PLAYER_ISAAC

    elseif n == 1 then    --Magdalene
        result = PlayerType.PLAYER_MAGDALENA

    elseif n == 2 then    --Cain
        result = PlayerType.PLAYER_CAIN

    elseif n == 3 then    --Judas
        result = PlayerType.PLAYER_JUDAS

    elseif n == 4 then    --BlueBaby
        result = PlayerType.PLAYER_XXX

    elseif n == 5 then    --Eve
        result = PlayerType.PLAYER_EVE

    elseif n == 6 then    --Samson
        result = PlayerType.PLAYER_SAMSON

    elseif n == 7 then    --Azazel
        result = PlayerType.PLAYER_AZAZEL

    elseif n == 8 then    --Lazarus
        result = PlayerType.PLAYER_LAZARUS

    elseif n == 9 then    --Eden
        result = PlayerType.PLAYER_EDEN

    elseif n == 10 then   --The Lost
        result = PlayerType.PLAYER_THELOST

    elseif n == 11 then   --Lilith
        result = PlayerType.PLAYER_LILITH

    elseif n == 12 then   --Keeper
        result = PlayerType.PLAYER_KEEPER

    elseif n == 13 then   --Apollyon
        result = PlayerType.PLAYER_APOLLYON

    elseif n == 14 then   --The Forgotten
        result = PlayerType.PLAYER_THEFORGOTTEN

    elseif n == 15 then   --Bethany
        result = PlayerType.PLAYER_BETHANY

    elseif n == 16 then   --Jacob (& Esau)
        result = PlayerType.PLAYER_JACOB
    end

    return result
end