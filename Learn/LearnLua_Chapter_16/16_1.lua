function loadwithprefix(prefix, code)
    assert(type(prefix) == 'string', "prefix need a string")
    assert(type(code) == 'string' or type(code) == 'function', "data need a string or function")
    
    local func
    if type(code) == 'function' then
        func = code
    else
        local isloaddata = false
        func = function()
            if isloaddata then return nil end
            isloaddata = true
            return code
        end
    end

    local isprefixload = false
    local prefunc = function()
        if isprefixload then return func() end
        isprefixload = true
        return prefix
    end

    return load(prefunc, "prefix functoin", "t")
end

-- 下面这个调用因为没有定义i， 所以会导致load错误，但是并不会报异常，而是返回了错误信息
-- print(loadwithprefix("return ", "i = i + 1"))

local f, msg = loadwithprefix("return ", "1 + 1")

if f == nil then
    error(msg)
else
    print(f())
end