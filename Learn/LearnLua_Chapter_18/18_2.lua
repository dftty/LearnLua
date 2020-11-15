function fromto(n, m, step)
    if step == nil then
        step = 1
    end
    assert(type(step) == "number", "step need a number")
    step = math.floor(step)
    local i = n - step
    return function()
        if i + step > m then
            return nil
        end
        i = i + step
        return i
    end
end

for i in fromto(2, 10, 2) do
    print(i)
end

print("no state version")
--- no state version

function fromto_nostate_iter(pair, n) 
    if n + pair.step > pair.m then
        return nil
    end
    return n + pair.step
end

function fromto_nostate(n, m, step)
    if step == nil then
        step = 1
    end
    assert(type(step) == "number", "need a number step")
    step = math.floor(step)
    return fromto_nostate_iter, {m = m, step = step}, n - step
end

for i in fromto_nostate(2, 10) do
    print(i)
end

---
