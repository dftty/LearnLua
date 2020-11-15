-- 迭代器

-- 利用闭包实现迭代器，这个迭代器只返回当前的值，不返回key
function itera(t)
    assert(type(t) == "table", "need a table")
    local i = 0
    return function()
        i = i + 1
        return t[i]
    end
end

local l = {1, 2, 3, 4}

for k in itera(l) do
    print(k)
end

local str = "  hello world"
print(string.match(str, "(%w+)()"))


for k, v in next, l do
    print(k .. v)
end