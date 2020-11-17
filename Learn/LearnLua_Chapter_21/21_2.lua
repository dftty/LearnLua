local Stack = require("21_1")

local StackQueue = Stack:new({})
StackQueue.__index = StackQueue

function StackQueue:new(o)
    o = o or {}
    return setmetatable(o, self)
end

function StackQueue:insertbottom(val)
    table.insert(self.array, 1, val)
end

return StackQueue