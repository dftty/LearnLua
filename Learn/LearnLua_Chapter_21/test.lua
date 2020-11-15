local Account = require("account")

local a = Account:new({})

a:deposit(100)
print(a.balance)