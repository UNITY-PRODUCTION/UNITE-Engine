local replicatedStorage = game:GetService("ReplicatedStorage")
local configuration = require(replicatedStorage.UNITE_Engine.Configuration)

local starterGui = game:GetService("StarterGui")

local General = function()
    for a, b in pairs(configuration.coreGui) do
        starterGui:SetCoreGuiEnabled(Enum.CoreGuiType[a], b)
    end
end

return General