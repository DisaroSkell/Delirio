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

-- Tests if the conversion works as expected
function MaskToBoolTabTest()
    local tab = BlackHeartMaskToBoolTab(7)

    local result = tab[1] and tab[2] and tab[3]

    if not result then
        print("MaskToBoolTabTest failed:")
        print("Expected true from index 1, 2 and 3, got " .. tostring(tab[1]) .. ", " .. tostring(tab[2]) .. " and " .. tostring(tab[3]))
    end

    return result
end

-- Tests if the function handles mask that are too big
function MaskTooBigTest()
    local tab = BlackHeartMaskToBoolTab(4096)

    local result = tab[1] == nil

    if not result then
        print("MaskTooBigTest failed:")
        print("Expected empty tab, got " .. tostring(tab[1]) .. " at index 1")
    end

    return result
end

-- Tests if the function counts as expected
function CountBoolTabTest()
    local testTab = {false, true, false, true, false, false, false, false, true, false, false, true}

    local count = CountBoolTab(testTab)

    local result = count == 4

    if not result then
        print("CountBoolTabTest failed:")
        print("Expected 4, got " .. tostring(count))
    end

    return result
end

-- Cross test between MaskToBoolTab and CountBoolTab
function MaskToCountTest()
    local count = CountBoolTab(BlackHeartMaskToBoolTab(7))

    local result = count == 3

    if not result then
        print("MaskToCountTest failed:")
        print("Expected 3, got " .. tostring(count))
    end

    return result
end