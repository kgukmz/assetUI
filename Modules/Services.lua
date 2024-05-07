local Services_T = {}
local Services_MT = {}

function Services_T:Get(...)
    local Services = {}

    for _,Service in next, {...} do
        table.insert(Services, self[Service])
    end

    return table.unpack(Services)
end

function Services_MT.__index(self, Index)
    local Success = pcall(function()
        game:GetService(Index)
    end)

    if (not Success) then
        warn("Failed to get service:", Index)
        return nil
    end

    rawset(self, Index, game:GetService(Index))
    return rawget(self, Index)
end

setmetatable(Services_T, Services_MT)

return Services_T
