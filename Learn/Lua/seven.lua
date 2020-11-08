function writeTab(count)
    for i = 1, count do
        io.write("\t")
    end
end

function serialize(o, ...)
    local count, num = ... or 0
    print(num)
    local t = type(o)
    if t == "number" or t == "string" or t == "boolean" or t == "nil" then
        io.write(string.format("%q", o))
    elseif t == "table" then
        io.write("{\n")
        for k, v in pairs(o) do
            -- body
            writeTab(count + 1)
            io.write(k, " = ")
            serialize(v, count + 1)
            io.write(",\n")
        end
        writeTab(count)
        io.write("}")
        if count == 0 then
            io.write("\n")
        end
    end
end



serialize({a = 12, b = "lua", key = "another", {c = 12, d = "ddd", {c = 12, d = "ddd"}}})