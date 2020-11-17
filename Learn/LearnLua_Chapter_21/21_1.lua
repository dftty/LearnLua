local Stack = {array = {}, size = 0}
Stack.__index = Stack

function Stack:new(o)
    o = o or {}
    return setmetatable(o, self)
end

function Stack:push(val)
    if val == nil then
        assert("don't allow nil val")
    end
    table.insert(self.array, val)
    self.size = self.size + 1
end

function Stack:pop()
    if not self:isempty() then
        return table.remove(self.array, #self.array)
    end
    return nil
end

function Stack:top()
    if not self:isempty() then
        return self.array[#self.array]
    end
end

function Stack:isempty()
    return #self.array <= 0 
end

return Stack