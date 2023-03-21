require "script.HeartType"

---@class LifeBar
---@field hearts table
LifeBar = {}

---@param o? LifeBar @default: {}
---@param redCount? integer @default: 0
---@param containerCount? integer @default: 0
---@param soulCount? integer @default: 0
---@param blackCount? integer @default: 0
---@param boneCount? integer @default: 0
---@param eternalCount? integer @default: 0
---@param goldenCount? integer @default: 0
---@param brokenCount? integer @default: 0
---@return LifeBar
function LifeBar:new(o, redCount, containerCount, soulCount, blackCount, boneCount, eternalCount, goldenCount, brokenCount)
    o = o or {}

    setmetatable(o, self)
    self.__index = self

    redCount = redCount or 0
    containerCount = containerCount or 0
    soulCount = soulCount or 0
    blackCount = blackCount or 0
    boneCount = boneCount or 0
    eternalCount = eternalCount or 0
    goldenCount = goldenCount or 0
    brokenCount = brokenCount or 0

    setmetatable(o, self)
    self.__hearts = {}

    self.__hearts[HeartType.RED] = redCount
    self.__hearts[HeartType.CONTAINER] = containerCount
    self.__hearts[HeartType.SOUL] = soulCount
    self.__hearts[HeartType.BLACK] = blackCount
    self.__hearts[HeartType.BONE] = boneCount
    self.__hearts[HeartType.ETERNAL] = eternalCount
    self.__hearts[HeartType.GOLDEN] = goldenCount
    self.__hearts[HeartType.BROKEN] = brokenCount

    return o
end

function LifeBar:newFromPlayer(player)
    return LifeBar:new( {},
                        player:GetHearts(),
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
    return self.__hearts[type]
end

---@param otherBar LifeBar
---@overload fun(otherBar: LifeBar)
function LifeBar:Diff(otherBar)
    return LifeBar:new( {},
                        self:GetHeartCount(HeartType.RED) - otherBar:GetHeartCount(HeartType.RED),
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
function LifeBar:ToString()
	local result = ""

    for index, elem in ipairs(self.__hearts) do
		result = result .. elem.tostring()
        result = result .. " - "
	end

	return result
end