tab = {x = 10, y = 20}

local mt = {
    __index = function(_, t)
        return _.___
    end
}

function setDefault(t, d)
    t.___ = d
    setmetatable(t, mt)
end

setDefault(tab, 0)
print(tab.x, tab.z)
print(string.match("ello world", "[H]?ello"))
-- print(tab.x, tab.z)
-- setDefault(tab, 1)
-- print(tab.x, tab.___)