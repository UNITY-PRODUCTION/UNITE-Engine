local Configuration = {
--===================================================================================================
--[ ENGINE ]=========================================================================================
--===================================================================================================

    commandLine = {  -- Execute commands in real time.
        enabled = true,  -- If this setting is disabled, several features will also be disabled.
        keyCode = Enum.KeyCode.Quote
    },

    notification = {  -- Notification sent by the game engine.
        enabled = true,
        waitingTime = 20
    },

--===================================================================================================
--[ SECURITY ]=======================================================================================
--===================================================================================================

    ageRestrict = {  -- Kick new players who join the server.
        enabled = true,
        ageLimite = 30
    },

    blacklist = {  -- User IDs that are in the blacklist cannot join the server.
        enabled = true,
        userId = {}
    },

    whitelist = {  -- Only people who are in the whitelist can join the server.
        enabled = false,
        userId = {}
    },

    robloxGroup = {  -- Manage player permissions based on their role in a group.
        enabled = true,
        groupId = 15167882,
        rankPermissions = {
            [255] = {  -- Owner
                canJoinTheServer = true,
            },

            [0] = {  -- Guest
                canJoinTheServer = true,
            }
        }
    },

--===================================================================================================
--[ OTHER ]==========================================================================================
--===================================================================================================

    debugMode = true,
    version = "UNITE Engine 0.2.0 - SECURITY V2"
}

return Configuration