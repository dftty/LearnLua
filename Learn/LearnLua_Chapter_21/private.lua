---第一种实现方式
--- 将私有属性放入一个表中，接口放入另一个表中

function createAccount()
    local prop = {balance = 0}

    local withdraw = function(val)
        prop.balance = prop.balance - val
    end

    local deposit = function(val)
        prop.balance = prop.balance + val
    end

    local getbalance = function()
        return prop.balance
    end

    return {
        getbalance = getbalance,
        deposit = deposit,
        withdraw = withdraw
    }
end

local Account = createAccount()
Account.deposit(100)
print(Account.getbalance())

---

---第二种实现方式

function create(value)
    return function(type, v)
        if type == "get" then 
            return value 
        elseif type == "set" then 
            value = v 
        else 
            error("unknow type") 
        end
    end
end

local v = create(10)
v("set", 20)
print(v("get"))

---
---



---