---Function that converts PlayerType enum to String
---@param playerType PlayerType
---@return string
function PlayerTypeString(playerType)
	local result = ""

	if playerType == PlayerType.PLAYER_POSSESSOR then
		result = "POSSESSOR"
	end

	if playerType == PlayerType.PLAYER_ISAAC then
		result = "ISAAC"
	end

	if playerType == PlayerType.PLAYER_MAGDALENE then
		result = "MAGDALENE"
	end

	if playerType == PlayerType.PLAYER_CAIN then
		result = "CAIN"
	end

	if playerType == PlayerType.PLAYER_JUDAS then
		result = "JUDAS"
	end

	if playerType == PlayerType.PLAYER_BLUEBABY then
		result = "BLUEBABY"
	end

	if playerType == PlayerType.PLAYER_EVE then
		result = "EVE"
	end

	if playerType == PlayerType.PLAYER_SAMSON then
		result = "SAMSON"
	end

	if playerType == PlayerType.PLAYER_AZAZEL then
		result = "AZAZEL"
	end

	if playerType == PlayerType.PLAYER_LAZARUS then
		result = "LAZARUS"
	end

	if playerType == PlayerType.PLAYER_EDEN then
		result = "EDEN"
	end

	if playerType == PlayerType.PLAYER_THELOST then
		result = "THELOST"
	end

	if playerType == PlayerType.PLAYER_LAZARUS2 then
		result = "LAZARUS2"
	end

	if playerType == PlayerType.PLAYER_BLACKJUDAS then
		result = "BLACKJUDAS"
	end

	if playerType == PlayerType.PLAYER_LILITH then
		result = "LILITH"
	end

	if playerType == PlayerType.PLAYER_KEEPER then
		result = "KEEPER"
	end

	if playerType == PlayerType.PLAYER_APOLLYON then
		result = "APOLLYON"
	end

	if playerType == PlayerType.PLAYER_THEFORGOTTEN then
		result = "THEFORGOTTEN"
	end

	if playerType == PlayerType.PLAYER_THESOUL then
		result = "THESOUL"
	end

	if playerType == PlayerType.PLAYER_BETHANY then
		result = "BETHANY"
	end

	if playerType == PlayerType.PLAYER_JACOB then
		result = "JACOB"
	end

	if playerType == PlayerType.PLAYER_ESAU then
		result = "ESAU"
	end

	if playerType == PlayerType.PLAYER_ISAAC_B then
		result = "ISAAC_B"
	end

	if playerType == PlayerType.PLAYER_MAGDALENE_B then
		result = "MAGDALENE_B"
	end

	if playerType == PlayerType.PLAYER_CAIN_B then
		result = "CAIN_B"
	end

	if playerType == PlayerType.PLAYER_JUDAS_B then
		result = "JUDAS_B"
	end

	if playerType == PlayerType.PLAYER_BLUEBABY_B then
		result = "BLUEBABY_B"
	end

	if playerType == PlayerType.PLAYER_EVE_B then
		result = "EVE_B"
	end

	if playerType == PlayerType.PLAYER_SAMSON_B then
		result = "SAMSON_B"
	end

	if playerType == PlayerType.PLAYER_AZAZEL_B then
		result = "AZAZEL_B"
	end

	if playerType == PlayerType.PLAYER_LAZARUS_B then
		result = "LAZARUS_B"
	end

	if playerType == PlayerType.PLAYER_EDEN_B then
		result = "EDEN_B"
	end

	if playerType == PlayerType.PLAYER_THELOST_B then
		result = "THELOST_B"
	end

	if playerType == PlayerType.PLAYER_LILITH_B then
		result = "LILITH_B"
	end

	if playerType == PlayerType.PLAYER_KEEPER_B then
		result = "KEEPER_B"
	end

	if playerType == PlayerType.PLAYER_APOLLYON_B then
		result = "APOLLYON_B"
	end

	if playerType == PlayerType.PLAYER_THEFORGOTTEN_B then
		result = "THEFORGOTTEN_B"
	end

	if playerType == PlayerType.PLAYER_BETHANY_B then
		result = "BETHANY_B"
	end

	if playerType == PlayerType.PLAYER_JACOB_B then
		result = "JACOB_B"
	end

	if playerType == PlayerType.PLAYER_LAZARUS2_B then
		result = "LAZARUS2_B"
	end

	if playerType == PlayerType.PLAYER_JACOB2_B then
		result = "JACOB2_B"
	end

	if playerType == PlayerType.PLAYER_THESOUL_B then
		result = "THESOUL_B"
	end

	if playerType == PlayerType.NUM_PLAYER_TYPES then
		result = "NUM_PLAYER_TYPES"
	end

	return result
end

---Function to convert the mask you get from GetBlackHearts to a boolean array
---@param mask integer maximum (2^12)-1
---@return table; {} if mask if too big
function BlackHeartMaskToBoolTab(mask)
	if mask > 4095 then
		local debug = "BlackHearts mask given is too big !"

		if Isaac == nil then
			print(debug)
		else
			Isaac.ConsoleOutput(debug)
		end

		return {};
	end

	local result = {false, false, false, false, false, false, false, false, false, false, false, false}
	local currentMask = mask

	for i = 11, 0, -1 do
		if currentMask >= 2^i then
			result[i+1] = true
			currentMask = currentMask - 2^i
		end
	end

	return result
end