require "script.LifeBar"

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
	instance.characters[PlayerType.PLAYER_KEEPER] = LifeBar.new(6, 6)
	instance.characters[PlayerType.PLAYER_APOLLYON] = LifeBar.new(4, 4)
	instance.characters[PlayerType.PLAYER_THEFORGOTTEN] = LifeBar.new(4, 0, 0, 0, 2)
	instance.characters[PlayerType.PLAYER_THESOUL] = LifeBar.new(0, 0, 2)
	instance.characters[PlayerType.PLAYER_BETHANY] = LifeBar.new(6, 6)
	instance.characters[PlayerType.PLAYER_JACOB] = LifeBar.new(6, 6)
	instance.characters[PlayerType.PLAYER_ESAU] = LifeBar.new(2, 2, 2)

    instance.delirio = LifeBar.new(0, 0, 0, 2, 0, 1)

    return instance
end

---Getter for characters tab elements
---@param player PlayerType
---@return LifeBar
function DelirioLife:GetLife(player)
    return self.characters[player]
end

---Setter for characters tab elements
---@param player PlayerType
---@param life LifeBar
function DelirioLife:ChangeLife(player, life)
    self.characters[player] = life
end

---Getter for delirio's life (his true form)
---@return LifeBar
function DelirioLife:GetDelirioLife()
    return self.delirio
end

---Setter for delirio's life (his true form)
---@param life LifeBar
function DelirioLife:ChangeDelirioLife(life)
    self.delirio = life
end

---Stores current life of the player in parameter in self
---@param player EntityPlayer
DelirioLife.StoreLife = function (self, player)
    local life = LifeBar.newFromPlayer(player)

    if player:GetName() == "Delirio" then
        self:ChangeDelirioLife(life)
    else
        local currentPlayerType = player:GetPlayerType()

        if currentPlayerType == PlayerType.PLAYER_JACOB then
            -- Store life of Esau
            self:ChangeLife(player:GetOtherTwin():GetPlayerType(), LifeBar.newFromPlayer(player:GetOtherTwin()))
        end

        if currentPlayerType == PlayerType.PLAYER_THEFORGOTTEN then
            -- Store life of The Soul
            self:ChangeLife(player:GetSubPlayer():GetPlayerType(), LifeBar.newFromPlayer(player:GetSubPlayer()))
        end

        self:ChangeLife(currentPlayerType, life)
    end
end

---Change life of the player in parameter to match the life stored in self
---@param player EntityPlayer
---@param nextPlayerType PlayerType
DelirioLife.LoadLife = function (self, player, nextPlayerType)
    local currentLife = LifeBar.newFromPlayer(player)
    local goalLife = {}

    if player:GetName() == "Delirio" then
        goalLife = self:GetDelirioLife()
    else
        goalLife = self:GetLife(nextPlayerType)
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
    player:AddBlackHearts(goalLife:GetHeartCount(HeartType.BLACK) - CountBoolTab(BlackHeartMaskToBoolTab(player:GetBlackHearts()))*2)

    if player:GetPlayerType() == PlayerType.PLAYER_JACOB then
        -- Load life of Esau
        self:LoadLife(player:GetOtherTwin(), player:GetOtherTwin():GetPlayerType())
    end

    if player:GetPlayerType() == PlayerType.PLAYER_THEFORGOTTEN then
        -- Load life of The Soul
        self:LoadLife(player:GetSubPlayer(), player:GetSubPlayer():GetPlayerType())
    end
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