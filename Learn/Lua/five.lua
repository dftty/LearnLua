function disk(cx, cy, r)
    return function(x, y)
        return (x - cx) ^ 2 - (y - cy) ^ 2 <= r ^ 2
    end
end

function F(x)
    return {
        set = function(y) x = y end,
        get = function() return x end
    }
end

o1 = F(10)
o2 = F(20)

print(o1.get(), o2.get())
o1.set(300)
o2.set(100)

print(o1.get(), o2.get())

a = {}
a.a = a
print(a)
print(a.a)
print(a.a.a)

a.a.a.a = 3
print(a.a)

E = {}

zip = (((company or E).director or E).addredd or E).zipcode