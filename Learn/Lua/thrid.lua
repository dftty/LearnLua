-- 这是学习lua的第三个脚本

-- 表 table 这是lua中唯一的数据结构

a = {}
a.x = 10
print(a.x)
print(a["x"])

-- 这里a[x] 表示是指由变量x为键进行索引，而上面a.x是以"x" 字符串为键进行索引
x = 10
a[x] = 20
print(a[x])

-- 表构造器
a = {"1", "2", "3", "4", "5"}

-- 构造器构造时下标起始位置是1
print(a[1])

-- 还可以这样构造
a = {x = 10, y = 20}

-- 这是嵌套表的示例
a = {{x = 0, y = 0}, {z = 10, w = 20}}

print(a[1].x)

a = {}
a[1] = 1
a[2] = 2
a[3] = 3
a[4] = 4
print(#a)
a[4] = nil
print(#a)

-- 遍历表 pairs遍历不一定按顺序输出
for k,v in pairs(a) do
    print(k, v)
end

t = {10, print, 12, "hi"}
for k, v in pairs(t) do
    print(k, v)
end

for k = 1, #t do
    print(k, t[k])
end

-- ipairs可以保证遍历按顺序输出
for k, v in ipairs(t) do
    print(k, v)
end

table.insert( a, 2, 10)
table.insert(a, 20)
table.remove(t)
for k = 1, #a do
    print(k, a[k])
end

sunday = "monday"
monday = "sunday"
t = {sunday = "monday", [sunday] = monday}
print(t.sunday, t[sunday], t[t.sunday], t["sunday"])