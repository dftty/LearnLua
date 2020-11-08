local name = "hello world"
local i, j = string.find(name, "hello")
print(string.sub(name, string.find(name, "hello")))


local name = "lua is great"
print(string.gsub(name, "great", "aaa"))


local str = "_abcABC123_ ,%';\n\t"
print(str)

print(string.match("_ab_", "[_%l][_%w]*"))

-- 捕获 () 在括号中的匹配会被捕获 并且返回
print(string.match("wefasv$", "(.-)as(.)"))

print(string.gsub("[$name is", "%[$n", "aa"))

print(string.find(";$% **#aa", "%a+"))

print(string.match("123AAA", "[%U]*"))

function split(str, pattern)
    local res = {}
    local start = 1
    i, j = string.find(str, pattern)
    while i ~= nil and j ~= nil do
        if i > start then
            table.insert(res, string.sub(str, start, i - 1))
        end
        
        start = j + 1
        i, j = string.find(str, pattern, j + 1)
    end

    if start <= #str then
        table.insert(res, string.sub(start, #str))
    end
    return res
end

function split_(str, pattern)
    if pattern == nil then
        pattern = "%s+"
    end
    local t = {}
    for str in string.gmatch(str, "[^" .. pattern .."]+") do
        table.insert(t, str)
    end
    return t
end

t = split_("a;a;;b", ";")
for _, value in ipairs(t) do
    print(#value)
end
