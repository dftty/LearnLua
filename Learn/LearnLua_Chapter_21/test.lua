local Stack = require("21_3")

local s = Stack:new({})
local s1 = Stack:new()

s:push(10)
s1:push(20)
print(s:top())
print(s1:top())