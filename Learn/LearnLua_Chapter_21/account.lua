local Account = {balance = 0}

function Account:new(o)
    o = o or {}
    self.__index = self
    return setmetatable(o, self)
end

function Account:deposit(val)
    self.balance = self.balance + val
end

function Account:withdraw(val)
    self.banance = self.balance - val
end

return Account