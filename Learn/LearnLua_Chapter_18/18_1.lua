function fromto(n, m)
    local i = n - 1
    return function()
        if i >= m then
            return nil
        end
        i = i + 1
        return i
    end
end

for i in fromto(1, 10) do
    print(i)
end


print("no state iter version--------")
-- 这是无状态迭代器实现
function fromto_nostate(m, n)
    if n >= m then
        return nil
    end
    return n + 1
end

function fromto_nostate_iter(n, m)
    return fromto_nostate, m, n - 1
end

for i in fromto_nostate_iter(1, 10) do
    print(i)
end
----