file = io.open("1.txt")

-- for str in file:lines() do
--     print(str)
-- end

str = file:lines()

while true do
    s = str()
    if s == nil then break end
    print(s)
    print(string.find(s, "d"))
    print(string.gsub(s, "a", "b"))
    print("----")
end

list = {}

list = {next = list, value = 1}

list = {next = list, value = 2}

l = list
while l do
    print(l.value)
    l = l.next
end
