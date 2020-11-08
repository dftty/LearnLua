function getPoint(x, y)
    return function()
        return x, y
    end
end

local point = getPoint(1, 2)

x, y = point()
print(x, y)
print(point())

