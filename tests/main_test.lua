package.path = package.path .. ";../?.lua"
require "tests.functions_test"

local test_count = 0
local grade = 0

if (LifeBarGetterTest()) then
    grade = grade + 1
    print("LifeBarGetterTest passed.")
end
test_count = test_count + 1

if (LifeBarConstructorOverwriteTest()) then
    grade = grade + 1
    print("LifeBarConstructorOverwriteTest passed.")
end
test_count = test_count + 1

if (LifeBarDiffTest()) then
    grade = grade + 1
    print("LifeBarDiffTest passed.")
end
test_count = test_count + 1

if (MaskToBoolTabTest()) then
    grade = grade + 1
    print("MaskToBoolTabTest passed.")
end
test_count = test_count + 1

if (MaskTooBigTest()) then
    grade = grade + 1
    print("MaskTooBigTest passed.")
end
test_count = test_count + 1

print(grade .. "/" .. test_count .. " tests passed.")