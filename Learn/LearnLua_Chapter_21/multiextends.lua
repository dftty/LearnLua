function search(list, key)
    for i = 1, #list do
        local v = list[i][key]
        if v then
            return v
        end
    end
end

function createclass(...)
    local c = {}
    local list = {...}
    c.__index = function(_, k)
        return search(list, k)
    end

    function c:new(o)
        o = o or {}
        return setmetatable(o, c)
    end

    return c
end

local Account = require("account")

local Name = {}

function Name:getName()
    return self.name
end

function Name:setName(name)
    self.name = name
end

local NameAccount = createclass(Account, Name)

local n = NameAccount:new({name = "aaa"})

print(n:getName())