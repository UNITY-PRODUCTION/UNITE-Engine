local replicatedStorage = game:GetService("ReplicatedStorage")
local configuration = require(replicatedStorage.UNITE_Engine.Configuration)

local players = game:GetService("Players")
local player = players.LocalPlayer

local Camera = function()
    player.CameraMode = configuration.camera.cameraMode

    if player.CameraMode == Enum.CameraMode.Classic then
        player.CameraMaxZoomDistance = configuration.camera.cameraMaxZoomDistance
        player.CameraMinZoomDistance = configuration.camera.cameraMinZoomDistance
    elseif player.CameraMode == Enum.CameraMode.LockFirstPerson then
    end
end

return Camera