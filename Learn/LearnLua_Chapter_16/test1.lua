function test(...)
    print(...)
end

test(io.lines("test.lua", "*L"))
test(io.lines("test.lua", "*L"), "print")