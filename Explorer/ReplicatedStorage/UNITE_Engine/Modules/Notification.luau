local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Configuration = require(ReplicatedStorage.UNITE_Engine.Configuration)

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui  = Player:WaitForChild("PlayerGui")

local screenGui = PlayerGui.Notification
local objects = screenGui.Background

local notification = function(title, description, image)
	if Configuration.notification.enabled then
		local destroyed = false

		for _, object in ipairs(objects:GetChildren()) do
			if object:IsA("Frame") then
				object.LayoutOrder = object.LayoutOrder - 1
			end
		end

		local object = objects.Template:Clone()
		object.Name = "Notification"
		object.Parent = objects

		object.TitleLabel.Text = title
		object.TextLabel.Text = description
		object.ImageLabel.Image = image
		object.Visible = true

		object.CloseButton.MouseButton1Click:Connect(function()
			object:Destroy()
			destroyed = true
		end)

		for i = Configuration.notification.waitingTime, 1, -1 do
			if destroyed then return false end
			object.TimeLabel.Text = i
			task.wait(1)
		end

		object:Destroy()
	end
end

return notification