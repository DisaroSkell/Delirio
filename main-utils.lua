require "script.DelirioLife"

local Delirio = {}

-- (Re)initialize the variables for every game start
function LifeInit()
    Delirio = DelirioLife:new()
end

-- Life storage here
function StoreLife(player)
    local life = LifeBar.newFromPlayer(player)

    if player:GetName() == "Delirio" then
        Delirio:ChangeDelirioLife(life)
    else
        Delirio:ChangeLife(player:GetPlayerType(), life)
    end
end

function LoadLife(player, nextPlayerType)
    local currentLife = LifeBar.newFromPlayer(player)
    local goalLife = {}

    if player:GetName() == "Delirio" then
        goalLife = Delirio:GetDelirioLife()
    else
        goalLife = Delirio:GetLife(nextPlayerType)
    end

    local diff = goalLife:Diff(currentLife)

    player:AddHearts(diff:GetHeartCount(HeartType.RED))
    player:AddMaxHearts(diff:GetHeartCount(HeartType.CONTAINER))
    player:AddSoulHearts(diff:GetHeartCount(HeartType.SOUL))
    player:AddBlackHearts(diff:GetHeartCount(HeartType.BLACK))
    player:AddBoneHearts(diff:GetHeartCount(HeartType.BONE))
    player:AddEternalHearts(diff:GetHeartCount(HeartType.ETERNAL))
    player:AddGoldenHearts(diff:GetHeartCount(HeartType.GOLDEN))
    player:AddBrokenHearts(diff:GetHeartCount(HeartType.BROKEN))
end