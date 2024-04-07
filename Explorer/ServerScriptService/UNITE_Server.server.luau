local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Configuration = require(ReplicatedStorage.UNITE_Engine.Configuration)

local Players = game:GetService("Players")

print(Configuration.version)

local function onKick(player, title, reason)
    player:Kick(reason)
    
    if Configuration.debugMode then
        warn(title, ":", player.Name, "tried to join to server.")
    end
end

local function onPlayerAdded(player)
    if Configuration.debugMode then
        print(player.Name, "has joined the server.")
    end

    if Configuration.ageRestrict.enabled and player.AccountAge < Configuration.ageRestrict.ageLimite then
        local remainingAge = Configuration.ageRestrict.ageLimite - player.AccountAge
        onKick(player, "[AGE RESTRICTION]", ("Age restriction has been enabled on the server. Please wait " .. remainingAge .. "days to join the server."))
    end

    if Configuration.blacklist.enabled and table.find(Configuration.blacklist.userId, player.UserId) then
        onKick(player, "[BLACKLIST]", "You are registered in the blacklist.")
    end

    if Configuration.whitelist.enabled and not table.find(Configuration.whitelist.userId, player.UserId) then
        onKick(player, "[WHITELIST]", "You are not registered in the whitelist.")
    end

    if Configuration.robloxGroup.enabled then
        local rankInGroup = player:GetRankInGroup(Configuration.robloxGroup.groupId)
        if not Configuration.robloxGroup.rankPermissions[rankInGroup].canJoinTheServer then
            onKick(player, "[ROBLOX GROUP]", "Your current permissions do not allow you to join the server.")
        end
    end
end

local function onPlayerRemoving(player)
    if Configuration.debugMode then
        print(player.Name, "has left the server.")
    end
end

local function onBindToClose()
    if Configuration.debugMode then
        print("Closing the server.")
    end
end

Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(onPlayerRemoving)
game:BindToClose(onBindToClose)