-- 这是学习lua的第二个脚本

-- # 表示获取字符串a的长度
a = "hello"
print(#a)

-- ..表示连接操作符
a = a .. " world"
print(a)

-- 方括号表示长字符串或多行字符串
a = [==[
this 
is 
a 
long 
string
]==]
print(a)

-- 可以在多行注释的方括号中间添加任意数量的等号，然后就可以嵌套多行注释了
--[=[
    --[[
        
    --]]
--]=]

--lua在运行时提供了字符串和数值之间的自动转换
print(math.max("10", "20"))
print(10 .. 20)


print(tonumber("-1"))

a = math.maxinteger
while(a > 0) do
    a = a // 2
end

-- lua中string.sub(s, i, j) 支持负数索引,下标从1或-1开始,截取的字符串包括i,j
a = "[in brackets]"

print(string.sub(a, -9, -2))
print(string.sub(a, 2, -2))

print(string.len("a"));
print(utf8.len("a"));

a = [=[
<![CDATA[
    Hello world
]]
]=]
print(a)
a = "<![CDATA[\n  Hello world\n]]>"
print(a)

function insert(source, index, target)
    len = string.len(source)
    return string.sub(source, 1, index - 1) .. target .. string.sub(source, index, len)
end

print(insert("hello world", 7, "small "))