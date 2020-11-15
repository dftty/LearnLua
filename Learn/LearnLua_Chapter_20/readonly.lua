local ReadOnly = {}

local mt = {
    __index = function(self, k)
        return self.__readonly[k]
    end,
    __newindex = function(self, k, v)
        error("attempt to update a read-only table", 2)
    end
}

function ReadOnly.new(t)
    local proxy = {}
    proxy.__readonly = t
    return setmetatable(proxy, mt)
end


local weekTable = ReadOnly.new({"Sunday", "Monday"})

print(weekTable[1])