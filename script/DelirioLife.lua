require "script.LifeBar"

---@class DelirioLife
---@field characters table
---@field delirio LifeBar
DelirioLife = {}

---@param o? DelirioLife @default: {}
---@return DelirioLife
function DelirioLife:new(o)
    o = o or {}

    setmetatable(o, self)
    self.__index = self

    self.__characters = {}

    self.__characters[PlayerType.PLAYER_ISAAC] = LifeBar:new({}, 6, 3)
    self.__characters[PlayerType.PLAYER_MAGDALENE] = LifeBar:new({}, 8, 4)
	self.__characters[PlayerType.PLAYER_CAIN] = LifeBar:new({}, 4, 2)
	self.__characters[PlayerType.PLAYER_JUDAS] = LifeBar:new({}, 2, 1)
	self.__characters[PlayerType.PLAYER_BLUEBABY] = LifeBar:new({}, 0, 0, 6)
	self.__characters[PlayerType.PLAYER_EVE] = LifeBar:new({}, 4, 2)
	self.__characters[PlayerType.PLAYER_SAMSON] = LifeBar:new({}, 6, 3)
	self.__characters[PlayerType.PLAYER_AZAZEL] = LifeBar:new({}, 0, 0, 0, 6)
	self.__characters[PlayerType.PLAYER_LAZARUS] = LifeBar:new({}, 6, 3)
	self.__characters[PlayerType.PLAYER_EDEN] = LifeBar:new({}, 6, 3) ---@TODO make this random
	self.__characters[PlayerType.PLAYER_THELOST] = LifeBar:new({}, 0, 0, 1)
	self.__characters[PlayerType.PLAYER_LAZARUS2] = LifeBar:new({}, 2, 1)
	self.__characters[PlayerType.PLAYER_BLACKJUDAS] = LifeBar:new({}, 0, 0, 0, 4)
	self.__characters[PlayerType.PLAYER_LILITH] = LifeBar:new({}, 2, 1, 0, 4)
	self.__characters[PlayerType.PLAYER_KEEPER] = LifeBar:new({}, 3, 3)
	self.__characters[PlayerType.PLAYER_APOLLYON] = LifeBar:new({}, 4, 2)
	self.__characters[PlayerType.PLAYER_THEFORGOTTEN] = LifeBar:new({}, 4, 0, 0, 0, 2)
	self.__characters[PlayerType.PLAYER_THESOUL] = LifeBar:new({}, 0, 0, 2)
	self.__characters[PlayerType.PLAYER_BETHANY] = LifeBar:new({}, 6, 3)
	self.__characters[PlayerType.PLAYER_JACOB] = LifeBar:new({}, 6, 3)
	self.__characters[PlayerType.PLAYER_ESAU] = LifeBar:new({}, 2, 1, 2)

    self.__delirio = LifeBar:new({}, 0, 0, 0, 2, 0, 1)

    return o
end

---@param player PlayerType
---@return LifeBar
function DelirioLife:GetLife(player)
    return self.__characters[player]
end

---@param player PlayerType
---@param life LifeBar
function DelirioLife:ChangeLife(player, life)
    self.__characters[player] = life
end

---@return LifeBar
function DelirioLife:GetDelirioLife()
    return self.__delirio
end

---@param life LifeBar
function DelirioLife:ChangeDelirioLife(life)
    self.__delirio = life
end

---Function to display DelirioLife (debug purposes)
---@return string
function DelirioLife:ToString()
	local result = ""

	for index, elem in ipairs(self.__characters) do
		result = result .. elem:ToString()
		result = result .. "\n"
	end

	result = result .. self.__delirio:ToString()

	return result
end