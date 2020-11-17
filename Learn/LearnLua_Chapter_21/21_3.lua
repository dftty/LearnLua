--- 对偶实现Stack

local Stack = {}
Stack.__index = Stack

local array = {}

function Stack:new(o)
    o = o or {}
    array[o] = {}
    return setmetatable(o, self)
end

function Stack:push(val)
    table.insert(array[self], val)
end

function Stack:pop()
    if not self:isempty() then
        return table.remove(array[self])
    end
end

function Stack:top()
    if not self:isempty() then
        return array[self][#array[self]]
    end
end

function Stack:isempty()
    return #array[self] <= 0
end

return Stack