require "script.HeartType"

---@class LifeBar
---@field hearts table
LifeBar = {}

MetaLifeBar = {}
MetaLifeBar.__index = LifeBar

---Constructor of the class
---@param redCount? integer @default: 0
---@param containerCount? integer @default: 0
---@param soulCount? integer @default: 0
---@param blackCount? integer @default: 0
---@param boneCount? integer @default: 0
---@param eternalCount? integer @default: 0
---@param goldenCount? integer @default: 0
---@param brokenCount? integer @default: 0
---@return LifeBar
function LifeBar.new(redCount, containerCount, soulCount, blackCount, boneCount, eternalCount, goldenCount, brokenCount)
    local instance = setmetatable({}, MetaLifeBar)

    redCount = redCount or 0
    containerCount = containerCount or 0
    soulCount = soulCount or 0
    blackCount = blackCount or 0
    boneCount = boneCount or 0
    eternalCount = eternalCount or 0
    goldenCount = goldenCount or 0
    brokenCount = brokenCount or 0

    instance.hearts = {}

    instance.hearts[HeartType.RED] = redCount
    instance.hearts[HeartType.CONTAINER] = containerCount
    instance.hearts[HeartType.SOUL] = soulCount
    instance.hearts[HeartType.BLACK] = blackCount
    instance.hearts[HeartType.BONE] = boneCount
    instance.hearts[HeartType.ETERNAL] = eternalCount
    instance.hearts[HeartType.GOLDEN] = goldenCount
    instance.hearts[HeartType.BROKEN] = brokenCount

    return instance
end

function LifeBar.newFromPlayer(player)
    return LifeBar.new( player:GetHearts(),
                        player:GetMaxHearts()/2,
                        player:GetSoulHearts(),
                        player:GetBlackHearts(),
                        player:GetBoneHearts(),
                        player:GetEternalHearts(),
                        player:GetGoldenHearts(),
                        player:GetBrokenHearts())
end

---Get the number of heart of the given type
---@param type HeartType
---@return integer
function LifeBar:GetHeartCount(type)
    return self.hearts[type]
end

---@param otherBar LifeBar
---@overload fun(otherBar: LifeBar)
function LifeBar:Diff(otherBar)
    return LifeBar.new( self:GetHeartCount(HeartType.RED) - otherBar:GetHeartCount(HeartType.RED),
                        self:GetHeartCount(HeartType.CONTAINER) - otherBar:GetHeartCount(HeartType.CONTAINER),
                        self:GetHeartCount(HeartType.SOUL) - otherBar:GetHeartCount(HeartType.SOUL),
                        self:GetHeartCount(HeartType.BLACK) - otherBar:GetHeartCount(HeartType.BLACK),
                        self:GetHeartCount(HeartType.BONE) - otherBar:GetHeartCount(HeartType.BONE),
                        self:GetHeartCount(HeartType.ETERNAL) - otherBar:GetHeartCount(HeartType.ETERNAL),
                        self:GetHeartCount(HeartType.GOLDEN) - otherBar:GetHeartCount(HeartType.GOLDEN),
                        self:GetHeartCount(HeartType.BROKEN) - otherBar:GetHeartCount(HeartType.BROKEN))
end

---Function to display DelirioLife (debug purposes)
---@return string
function LifeBar:__tostring()
	local result = ""

    for key, heartCount in pairs(self.hearts) do
        result = result .. key
        result = result .. ": "

        result = result .. heartCount
        result = result .. " - "
	end

    local size = string.len(result)

    if size > 3 then
        result = string.sub(result, 1, size-3)
    end

	return result
end