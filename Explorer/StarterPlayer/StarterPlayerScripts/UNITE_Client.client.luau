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

for _, moduleScript in ipairs(ReplicatedStorage.UNITE_Engine.Modules.Clients:GetChildren()) do
    onModuleCalled(moduleScript)
end

if Configuration.debugMode then
    print("[CLIENT] : All client-side modules have been loaded.")
end