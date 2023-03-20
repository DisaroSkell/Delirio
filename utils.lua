require "script.DelirioLife"

local Delirio = {}

-- (Re)initialize the variables for every game start
function LifeInit()
    Delirio = DelirioLife:new()
end

-- Life storage here
function StoreLife(player)
    local life = LifeBar:newFromPlayer(player)

    if player:GetName() == "Delirio" then
        Delirio:ChangeDelirioLife(life)
    else
        Delirio:ChangeLife(player:GetPlayerType(), life)
    end
end

function LoadLife(player, nextPlayerType)
    local currentLife = LifeBar:newFromPlayer(player)
    local goalLife = {}

    if player:GetName() == "Delirio" then
        goalLife = Delirio:GetDelirioLife()
    else
        goalLife = Delirio:GetLife(nextPlayerType)
    end

    Isaac.ConsoleOutput(Delirio:ToString())

    --[[ Isaac.ConsoleOutput("currentLife Red, Soul and Black hearts: ")
    Isaac.ConsoleOutput(currentLife:GetHeartCount(HeartType.RED))
    Isaac.ConsoleOutput(" - ")
    Isaac.ConsoleOutput(currentLife:GetHeartCount(HeartType.SOUL))
    Isaac.ConsoleOutput(" - ")
    Isaac.ConsoleOutput(currentLife:GetHeartCount(HeartType.BLACK))
    Isaac.ConsoleOutput("\n")

    Isaac.ConsoleOutput("goalLife Red, Soul and Black hearts: ")
    Isaac.ConsoleOutput(goalLife:GetHeartCount(HeartType.RED))
    Isaac.ConsoleOutput(" - ")
    Isaac.ConsoleOutput(goalLife:GetHeartCount(HeartType.SOUL))
    Isaac.ConsoleOutput(" - ")
    Isaac.ConsoleOutput(goalLife:GetHeartCount(HeartType.BLACK))
    Isaac.ConsoleOutput("\n") ]]

    local diff = goalLife:Diff(currentLife)

    --[[ Isaac.ConsoleOutput("Diff Red, Soul and Black hearts: ")
    Isaac.ConsoleOutput(diff:GetHeartCount(HeartType.RED))
    Isaac.ConsoleOutput(" - ")
    Isaac.ConsoleOutput(diff:GetHeartCount(HeartType.SOUL))
    Isaac.ConsoleOutput(" - ")
    Isaac.ConsoleOutput(diff:GetHeartCount(HeartType.BLACK))
    Isaac.ConsoleOutput("\n") ]]

    player:AddHearts(diff:GetHeartCount(HeartType.RED))
    player:AddMaxHearts(diff:GetHeartCount(HeartType.CONTAINER))
    player:AddSoulHearts(diff:GetHeartCount(HeartType.SOUL))
    player:AddBlackHearts(diff:GetHeartCount(HeartType.BLACK))
    player:AddBoneHearts(diff:GetHeartCount(HeartType.BONE))
    player:AddEternalHearts(diff:GetHeartCount(HeartType.ETERNAL))
    player:AddGoldenHearts(diff:GetHeartCount(HeartType.GOLDEN))
    player:AddBrokenHearts(diff:GetHeartCount(HeartType.BROKEN))
end