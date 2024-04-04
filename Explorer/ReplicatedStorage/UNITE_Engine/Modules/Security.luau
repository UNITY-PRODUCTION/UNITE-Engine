local replicatedStorage = game:GetService("ReplicatedStorage")
local configuration = require(replicatedStorage.UNITE_Engine.Configuration)
local HUD = replicatedStorage.UNITE_Engine.HUD

local players = game:GetService("Players")
local player = players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local Security = function()
    if configuration.robloxGroup.enabled then
        if configuration.robloxGroup.rankPermissions[player:GetRankInGroup(configuration.robloxGroup.groupId)].canAccessAdminPanel then
            local adminPanel = HUD.AdminPanel:Clone()
            adminPanel.Parent = playerGui
        end
    end
end

return Security