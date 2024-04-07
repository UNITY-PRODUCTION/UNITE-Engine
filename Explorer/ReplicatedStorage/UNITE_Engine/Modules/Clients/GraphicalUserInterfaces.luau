local ReplicatedStorage = game:GetService("ReplicatedStorage")
local hud = ReplicatedStorage.UNITE_Engine.HUD

local Players = game:GetService("Players")
local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

local GraphicalUserInterfaces = function()
    for _, screenGui in ipairs(hud:GetChildren()) do
        local gui = screenGui:Clone()
        gui.Parent = playerGui
    end
end

return GraphicalUserInterfaces