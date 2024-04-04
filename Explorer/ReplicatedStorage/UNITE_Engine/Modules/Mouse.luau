local replicatedStorage = game:GetService("ReplicatedStorage")
local configuration = require(replicatedStorage.UNITE_Engine.Configuration)

local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")

local function onInputBegan(input, gameProcessedEvent)
    print(1)
    if gameProcessedEvent and input.KeyCode == configuration.mouse.mouseKeyCode then
        if configuration.mouse.toggleMouse then
            userInputService.MouseIconEnabled = true
            userInputService.MouseBehavior = Enum.MouseBehavior.Default
        else
            userInputService.MouseIconEnabled = not userInputService.MouseIconEnabled
            if userInputService.MouseIconEnabled then
                userInputService.MouseBehavior = Enum.MouseBehavior.Default
            else
                userInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
            end
        end
    end
end

local function onInputEnded(input, gameProcessedEvent)
    print(2)
    if gameProcessedEvent and configuration.mouse.toggleMouse and input.KeyCode == configuration.mouse.mouseKeyCode then
        userInputService.MouseIconEnabled = false
        userInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
    end
end

local Mouse = function()
    if configuration.mouse.enabled then
        userInputService.MouseIconEnabled = false
        if configuration.camera.cameraMode == Enum.CameraMode.Classic then
            runService.RenderStepped:Connect(function()
                userInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
            end)
        end

        userInputService.InputBegan:Connect(onInputBegan)
        userInputService.InputEnded:Connect(onInputEnded)
    end
end

return Mouse