-- 自己的实现方法，有很多地方不好
function multiload(...)
    local code = table.pack(...)
    print(#code)
    for k, v in ipairs(code) do
        assert(type(v) == "string" or type(v) == "function", "need string or function")
    end

    local i = 1
    local func = function()
        if i > #code then
            return nil
        end

        local val = code[i]
        
        if type(val) == "string" then
            i = i + 1
            return val 
        else
            -- 这里可能是一个迭代器，因此需要多次调用，当迭代结束时，应该返回code中的下一个值，
            -- 但这里没办法返回，(如果下一个还是函数）因此返回一个分号代表一个空语句
            val = val()
            if val == nil then 
                i = i + 1
                return ";"
            else 
                return val
            end
        end
    end

    return load(func, "multi load func", "t")
end

local fun, msg = multiload("print(1)", io.lines("test.lua", "*L"), "print(2)")
if fun == nil then
    error(msg)
else
    fun()
end

-- 答案中的实现,将每个字符串封装成了一个函数

function multiload_answer(...)
    local code = table.pack(...)
    -- 不使用泛型循环的原因是这里需要修改这个表
    for i = 1, #code do
        assert(type(code[i]) == "string" or type(code[i]) == "function", "need string or function as args")
        if type(code[i]) == "string" then
            local args = code[i]
            local isLoad = false
            code[i] = function()
                if isLoad then return nil end
                isLoad = true
                return args
            end
        end
    end

    local i = 1
    local func = function()
        while code[i] do
            local arg = code[i]()
            if not arg then
                i = i + 1
            else
                return arg
            end
        end
    end

    return load(func, "multi load answer", "t")
end

-- 这样只传一个函数进入会发生错误， 在table.pack时长度错误，原因未知
-- local f, msg = multiload_answer(io.lines("test.lua", "*L"))
local f, msg = multiload_answer(io.lines("test.lua", "*L"), "print(1)")

if f == nil then
    error(msg)
else
    f()
end