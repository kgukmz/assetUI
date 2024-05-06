local Utilites = {}

function Utilites.MatchExecutor(Executor)
    if (identifyexecutor():match(Executor)) then
        return true
    end

    return false
end

function Utilites.RandomString(StringLength)
    local CharSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local RandomString = ""
    
    for i = 1, StringLength do
        local RandomIndex = math.random(1, #CharSet)
        RandomString = RandomString .. string.sub(CharSet, RandomIndex, RandomIndex)
    end
    
    return RandomString
end

function Utilites.MessageBoxNotify(Title, Description, Type)
    if (not getgenv().messagebox) then
        return
    end

    getgenv().messagebox(Title, Description, Type or 0)
end

return Utilites
