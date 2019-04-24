-- 这是学习lua的第一个脚本， 这个表示单行注释

print("Hello World")

-- 这里定义了一个函数，计算n的阶乘
function fact(n)
    if n == 0 then
        return 1
    else if n < 0 then
        return nil
    else
        return n * fact(n - 1)
    end
end
end

___ = 1

print("input a number:")
a = io.read("*n")
print(fact(a))
print(arg[0])
print(___)
print(fact(a) ~= 0)

-- 多行注释 两个连续字符串--加上两个方括号
--[[
print(10)

--]]


-- lua语言中有8中基本类型 nil boolean number string userdata function thread table

for i = -10, 10 do
    print(i, i % 3)
end