-- 这是学习lua的第四个脚本

-- 表 table 这是lua中唯一的数据结构

table = {}

function values(t)
    local i = 0
    return function()
        i = i + 1;
        return t[i]
    end
end

t = {10, 20, 30}
iter = values(t)
while true do 
    local element = iter()
    if element == nil then break end
    print(element)
end

do
    local oldMath = math.sin
    local k = math.pi / 180
    math.sin = function (x)
        return oldMath(k * x)
    end
end

print(math.sin(45))

add = function(a, b)
    return a + b
end

print(add(1, 2))



-- for element in values(t) do
--     print(element)
-- end