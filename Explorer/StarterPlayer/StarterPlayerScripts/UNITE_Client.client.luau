local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Configuration = require(ReplicatedStorage.UNITE_Engine.Configuration)

local function onModuleCalled(moduleScript)
    local result, err = pcall(function()
        if Configuration.debugMode then
            print("[CLIENT] : Loading module", moduleScript.Name)
        end
        local module = require(moduleScript)
        module()
    end)

    if not result then
        if Configuration.debugMode then
            warn("[CLIENT] :", err)
        end
    end
end

onModuleCalled(ReplicatedStorage.UNITE_Engine.Modules.Clients.GraphicalUserInterfaces)

for _, moduleScript in ipairs(ReplicatedStorage.UNITE_Engine.Modules.Clients:GetChildren()) do
    if moduleScript ~= "GraphicalUserInterfaces" then
        onModuleCalled(moduleScript)
    end
end

if Configuration.debugMode then
    print("[CLIENT] : All client-side modules have been loaded.")
end