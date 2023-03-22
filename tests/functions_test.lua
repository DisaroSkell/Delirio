package.path = package.path .. ";../?.lua"
require "script.DelirioLife"
require "tests.isaac_enums.PlayerType"

-- Tests the getter of the LifeBar
function LifeBarGetterTest()
    local bar = LifeBar.new(5, 3, 5)

    local result = bar:GetHeartCount(HeartType.SOUL) == 5

    if not result then
        print("LifeBarGetterTest failed:")
        print("Expected 5, got " .. bar:GetHeartCount(HeartType.SOUL))
    end

    return result
end

-- Tests if creating a second instance overwrites the first one
function LifeBarConstructorOverwriteTest()
    local bar1 = LifeBar.new(5, 3, 5)
    local bar2 = LifeBar.new(6, 5, 4)

    local result = bar1:GetHeartCount(HeartType.SOUL) == 5

    if not result then
        print("LifeBarConstructorOverwriteTest failed:")
        print("Expected 5, got " .. bar1:GetHeartCount(HeartType.SOUL))
    end

    return result
end

-- Tests if the diff method works as expected
function LifeBarDiffTest()
    local bar1 = LifeBar.new(5, 3, 5)
    local bar2 = LifeBar.new(6, 5, 4)

    local diff = bar1:Diff(bar2)

    local result = diff:GetHeartCount(HeartType.RED) == -1

    if not result then
        print("LifeBarDiffTest failed:")
        print("Expected -1, got " .. diff:GetHeartCount(HeartType.RED))
    end

    return result
end