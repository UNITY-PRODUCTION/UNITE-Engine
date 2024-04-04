local replicatedStorage = game:GetService("ReplicatedStorage")
local configuration = require(replicatedStorage.UNITE_Engine.Configuration)

local success, err = pcall(function()
    for _, module in pairs(replicatedStorage.UNITE_Engine.Modules:GetChildren()) do
        if module:IsA("ModuleScript") then
            if configuration.debugMode then
                print("[UNITE CLIENT] : Loading module :", module.Name)
            end
            local loadModule = require(module)
            loadModule()
        end
    end
end)

if configuration.debugMode then
    if success then
        print("[UNITE CLIENT] : All client-side modules have been loaded.")
    else
        warn(err)
    end
end