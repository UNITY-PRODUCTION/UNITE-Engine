local replicatedStorage = game:GetService("ReplicatedStorage")
local configuration = require(replicatedStorage.UNITE_Engine.Configuration)

local players = game:GetService("Players")

local function onKick(player, service, reason)
    if configuration.debugMode then
        warn(service, ":", player.Name, "tried to join to server.")
    end
    player:Kick(reason)
end

local function onPlayerRemoving(player)
    if configuration.debugMode then
        print(player.Name, "has left the server")
    end
end

local function onPlayerAdded(player)
    if configuration.ageRestrict.enabled and player.AccountAge < configuration.ageRestrict.ageLimite then
        onKick(player, "[AGE RESTRICTION]", ("Age restriction has been enabled on the server. Please wait " .. configuration.ageRestrict.ageLimite - player.AccountAge .. " days to join the server."))
    end

    if configuration.blacklist.enabled then
        for _, userId in configuration.blacklist.userId do
            if player.UserId == userId then
                onKick(player, "[BLACKLIST]", "You are registered in the blacklist.")
            end
        end
    end

    if configuration.whitelist.enabled then
        local inWhitelist = false
        for _, userId in configuration.whitelist.userId do
            if player.UserId == userId then
                inWhitelist = true
                break
            end
        end

        if not inWhitelist then
            onKick(player, "[WHITELIST]", "You are not registered in the whitelist.")
        end
    end

    if configuration.robloxGroup.enabled then
        if not configuration.robloxGroup.rankPermissions[player:GetRankInGroup(configuration.robloxGroup.groupId)].canJoinTheServer then
            onKick(player, "[ROBLOX GROUP]", "Your current permissions do not allow you to join the server.")
        end
    end

    local function onCharacterAdded()
        if configuration.debugMode then
            print(player.Name, "has joined the server.")
        end
    end

    player.CharacterAdded:Connect(onCharacterAdded)
end

print(configuration.version)

players.PlayerAdded:Connect(onPlayerAdded)
players.PlayerRemoving:Connect(onPlayerRemoving)