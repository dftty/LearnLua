function uniquewords(io)
    local line = io:read()
    local pos = 1
    local wordset = {}
    return function()
        while line do
            -- 这里的变量e开始写的是pos，相当于重新定义了一个pos，导致上面定义的pos无效
            -- 因此这里要么去掉local，要么多定义一个局部变量，这里选择多定义一个局部变量的原因是防止word全局命名冲突
            local word, e = string.match(line, "(%w+)()", pos)
            pos = e
            if word and not wordset[word] then
                wordset[word] = true
                return word
            elseif not word then
                line = io:read()
                pos = 1
            end
        end
    end
end

local f = io.open("1.txt")
for k in uniquewords(f) do
    print(k)
end


