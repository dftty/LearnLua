local str = "abc"

for i = 1, #str do
    for j = i, #str do
        print(string.sub(str, i, j))
    end
end

print("iter version")
-- 迭代器版本
function substr(str)
    local len = #str
    -- 单行定义多个值用逗号隔开，等号之后赋值也用逗号隔开，没有赋值的为nil
    local i, j = 1, 1
    return function()
        if j > len then
            i = i + 1
            j = i
        end
        if i > len then
            return nil
        end
        local sub = string.sub(str, i, j)
        j = j + 1
        return sub
    end
end

for s in substr(str) do
    print(s)
end
--