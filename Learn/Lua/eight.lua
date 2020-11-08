Set = {}
local mt = {}

function Set:new(l)
    local res = {}
    setmetatable(res, mt)
    for _, v in pairs(l) do 
        res[v] = true 
    end
    return res
end

function Set.union(a, b)
    local res = Set:new{}
    for k in pairs(a) do 
        res[k] = true 
    end
    for k in pairs(b) do
        res[k] = true
    end

    return res
end

function Set.intersection(a, b)
    local res = Set:new{}
    for k in pairs(a) do
        res[k] = b[k]
    end    
end

function Set.tostring(a)
    local l = {}
    for e in pairs(a) do
        l[#l + 1] = tostring(e)
    end

    return "{" .. table.concat(l, ", ") .. "}"
end

mt.__add = Set.union

s1 = Set:new({10, 20, 30, 40})
s2 = Set:new{30, 1}
s3 = s1 + s2

print(Set.tostring(s3))