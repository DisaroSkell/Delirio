require "script.LifeBar"
require "script.script-utils"

---@class DelirioLife
---@field characters table
---@field delirio LifeBar
DelirioLife = {}

MetaDelirioLife = {}
MetaDelirioLife.__index = DelirioLife

---Constructor of the class
---@return DelirioLife
function DelirioLife.new()
    local instance = setmetatable({}, MetaDelirioLife)

    instance.characters = {}

    instance.characters[PlayerType.PLAYER_ISAAC] = LifeBar.new(6, 6)
    instance.characters[PlayerType.PLAYER_MAGDALENE] = LifeBar.new(8, 8)
	instance.characters[PlayerType.PLAYER_CAIN] = LifeBar.new(4, 4)
	instance.characters[PlayerType.PLAYER_JUDAS] = LifeBar.new(2, 2)
	instance.characters[PlayerType.PLAYER_BLUEBABY] = LifeBar.new(0, 0, 6)
	instance.characters[PlayerType.PLAYER_EVE] = LifeBar.new(4, 4)
	instance.characters[PlayerType.PLAYER_SAMSON] = LifeBar.new(6, 6)
	instance.characters[PlayerType.PLAYER_AZAZEL] = LifeBar.new(0, 0, 0, 6)
	instance.characters[PlayerType.PLAYER_LAZARUS] = LifeBar.new(6, 6)
	instance.characters[PlayerType.PLAYER_EDEN] = LifeBar.new(6, 6) ---@TODO make this random
	instance.characters[PlayerType.PLAYER_THELOST] = LifeBar.new(0, 0, 1)
	instance.characters[PlayerType.PLAYER_LAZARUS2] = LifeBar.new(2, 2)
	instance.characters[PlayerType.PLAYER_BLACKJUDAS] = LifeBar.new(0, 0, 0, 4)
	instance.characters[PlayerType.PLAYER_LILITH] = LifeBar.new(2, 2, 0, 4)
	instance.characters[PlayerType.PLAYER_KEEPER] = LifeBar.new(3, 3) ---@TODO Help please.
	instance.characters[PlayerType.PLAYER_APOLLYON] = LifeBar.new(4, 4)
	instance.characters[PlayerType.PLAYER_THEFORGOTTEN] = LifeBar.new(4, 0, 0, 0, 2)
	instance.characters[PlayerType.PLAYER_THESOUL] = LifeBar.new(0, 0, 1)
	instance.characters[PlayerType.PLAYER_BETHANY] = LifeBar.new(6, 6)
	instance.characters[PlayerType.PLAYER_JACOB] = LifeBar.new(6, 6)
	instance.characters[PlayerType.PLAYER_ESAU] = LifeBar.new(2, 2, 2)

    instance.delirio = LifeBar.new(0, 0, 0, 2, 0, 1)

    return instance
end

---@param player PlayerType
---@return LifeBar
function DelirioLife:GetLife(player)
    return self.characters[player]
end

---@param player PlayerType
---@param life LifeBar
function DelirioLife:ChangeLife(player, life)
    self.characters[player] = life
end

---@return LifeBar
function DelirioLife:GetDelirioLife()
    return self.delirio
end

---@param life LifeBar
function DelirioLife:ChangeDelirioLife(life)
    self.delirio = life
end

---Function to display DelirioLife (debug purposes)
---@return string
function DelirioLife:__tostring()
	local result = ""

	for index, lifebar in ipairs(self.characters) do
		result = result .. PlayerTypeString(index) .. ":\n"
		result = result .. lifebar:__tostring()
		result = result .. "\n"
	end

	result = result .. "Delirio:\n"
	result = result .. self.delirio:__tostring()

	return result
end