require "script.DelirioLife"

---Converts the int into PlayerType enum
---0 is Isaac, 1 is Maggy... 16 is Jacob&Esau
---@param n integer
---@return PlayerType
function ChosePlayerFromInt(n)
    local result = PlayerType.PLAYER_POSSESSOR

    if n == 0 then        --Isaac
        result = PlayerType.PLAYER_ISAAC

    elseif n == 1 then    --Magdalene
        result = PlayerType.PLAYER_MAGDALENA

    elseif n == 2 then    --Cain
        result = PlayerType.PLAYER_CAIN

    elseif n == 3 then    --Judas
        result = PlayerType.PLAYER_JUDAS

    elseif n == 4 then    --BlueBaby
        result = PlayerType.PLAYER_XXX

    elseif n == 5 then    --Eve
        result = PlayerType.PLAYER_EVE

    elseif n == 6 then    --Samson
        result = PlayerType.PLAYER_SAMSON

    elseif n == 7 then    --Azazel
        result = PlayerType.PLAYER_AZAZEL

    elseif n == 8 then    --Lazarus
        result = PlayerType.PLAYER_LAZARUS

    elseif n == 9 then    --Eden
        result = PlayerType.PLAYER_EDEN

    elseif n == 10 then   --The Lost
        result = PlayerType.PLAYER_THELOST

    elseif n == 11 then   --Lilith
        result = PlayerType.PLAYER_LILITH

    elseif n == 12 then   --Keeper
        result = PlayerType.PLAYER_KEEPER

    elseif n == 13 then   --Apollyon
        result = PlayerType.PLAYER_APOLLYON

    elseif n == 14 then   --The Forgotten
        result = PlayerType.PLAYER_THEFORGOTTEN

    elseif n == 15 then   --Bethany
        result = PlayerType.PLAYER_BETHANY

    elseif n == 16 then   --Jacob (& Esau)
        result = PlayerType.PLAYER_JACOB
    end

    return result
end

---Remove character-specific items from the current player
---(e. g. remove Dead Bird if the PlayerType is Eve)
---@param player EntityPlayer
function RemoveCharacterItem(player)
    if player:GetPlayerType() == PlayerType.PLAYER_CAIN then
        player:RemoveCollectible(CollectibleType.COLLECTIBLE_LUCKY_FOOT)
    elseif player:GetPlayerType() == PlayerType.PLAYER_EVE then
        player:RemoveCollectible(CollectibleType.COLLECTIBLE_DEAD_BIRD)
        player:RemoveCollectible(CollectibleType.COLLECTIBLE_WHORE_OF_BABYLON)
    elseif player:GetPlayerType() == PlayerType.PLAYER_SAMSON then
        player:RemoveCollectible(CollectibleType.COLLECTIBLE_BLOODY_LUST)
    elseif player:GetPlayerType() == PlayerType.PLAYER_LAZARUS then
        player:RemoveCollectible(CollectibleType.COLLECTIBLE_ANEMIC)
    elseif player:GetPlayerType() == PlayerType.PLAYER_LILITH then
        player:RemoveCollectible(CollectibleType.COLLECTIBLE_CAMBION_CONCEPTION)
    elseif player:GetPlayerType() == PlayerType.PLAYER_BETHANY then
        player:RemoveCollectible(CollectibleType.COLLECTIBLE_BOOK_OF_VIRTUES)
    end
end

---Add character-specific items for the current player
---(e. g. add Dead Bird if the PlayerType is Eve)
---@param player EntityPlayer
function AddCharacterItem(player)
    if player:GetPlayerType() == PlayerType.PLAYER_CAIN then
        player:AddCollectible(CollectibleType.COLLECTIBLE_LUCKY_FOOT)
    elseif player:GetPlayerType() == PlayerType.PLAYER_EVE then
        player:AddCollectible(CollectibleType.COLLECTIBLE_DEAD_BIRD)
        player:AddCollectible(CollectibleType.COLLECTIBLE_WHORE_OF_BABYLON)
    elseif player:GetPlayerType() == PlayerType.PLAYER_SAMSON then
        player:AddCollectible(CollectibleType.COLLECTIBLE_BLOODY_LUST)
    elseif player:GetPlayerType() == PlayerType.PLAYER_LAZARUS then
        player:AddCollectible(CollectibleType.COLLECTIBLE_ANEMIC)
    elseif player:GetPlayerType() == PlayerType.PLAYER_LILITH then
        player:AddCollectible(CollectibleType.COLLECTIBLE_CAMBION_CONCEPTION)
    elseif player:GetPlayerType() == PlayerType.PLAYER_BETHANY then
        player:AddCollectible(CollectibleType.COLLECTIBLE_BOOK_OF_VIRTUES)
    end
end