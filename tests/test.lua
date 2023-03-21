require "script.DelirioLife"
require "tests.isaac_enums.PlayerType"

local function print_tab(tab)
    local result = ""

    for index, elem in ipairs(tab) do
        result = result .. elem
        result = result .. " - "
	end

    print(result)
end

--[[ local Delirio = DelirioLife:new()

print("DelirioLife: ")
print(Delirio) ]]

print("A LifeBar: ")

local Bar = LifeBar:new({}, 3, 2)
print(Bar)

local boudin = {}

boudin[1] = 9
boudin[2] = 8

print_tab(boudin)