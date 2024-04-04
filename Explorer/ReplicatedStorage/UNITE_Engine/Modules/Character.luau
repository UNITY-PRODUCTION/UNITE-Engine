local replicatedStorage = game:GetService("ReplicatedStorage")
local configuration = require(replicatedStorage.UNITE_Engine.Configuration)

local players = game:GetService("Players")
local player = players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local Character = function()
    humanoid.WalkSpeed = configuration.character.characterWalkSpeed
    humanoid.MaxSlopeAngle = configuration.character.characterMaxSlopeAngle

    if configuration.characterJumpSettings.enabled then
        humanoid.JumpHeight = configuration.characterJumpSettings.characterJumpHeight
        humanoid.JumpPower = configuration.characterJumpSettings.characterJumpPower
        humanoid.UseJumpPower = configuration.characterJumpSettings.characterUsJumpPower
    else
        humanoid.JumpHeight = 0
        humanoid.JumpPower = 0
    end
end

return Character