local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Configuration = require(ReplicatedStorage.UNITE_Engine.Configuration)
local Commands = require(ReplicatedStorage.UNITE_Engine.Modules.Commands)
local Notification = require(ReplicatedStorage.UNITE_Engine.Modules.Notification)

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local UserInputService = game:GetService("UserInputService")

local screenGui = PlayerGui.CommandLine
local object = screenGui.Background

local function onInputEnded(input)
    if input.KeyCode == Configuration.commandLine.keyCode then
        screenGui.Enabled = not screenGui.Enabled
        if screenGui.Enabled then
            object.TextInput:CaptureFocus()
        else
            object.TextInput:ReleaseFocus()
            object.TextInput.Text = ""
        end
    end
end

local function onFocusLost(enterPressed)
    if enterPressed then
        local words = {}

        for word in object.TextInput.Text:gmatch("%S+") do
            table.insert(words, word)
        end

        for _, command in Commands do
            if command == words[1] then
                return true
            end
        end
        Notification("Invalid command.", "The command you entered is invalid.", "rbxassetid://14865930635")
    end
end

local commandLine = function()
    if Configuration.commandLine.enabled then
        UserInputService.InputEnded:Connect(onInputEnded)
        object.TextInput.FocusLost:Connect(onFocusLost)
    end
end

return commandLine