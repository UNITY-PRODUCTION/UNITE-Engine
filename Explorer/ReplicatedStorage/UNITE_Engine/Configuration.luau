local Configuration = {
--===================================================================================================
--[ GENERAL ]========================================================================================
--===================================================================================================

    coreGui = {
        Backpack = false,
        Captures = false,
        Chat = false,
        EmotesMenu = false,
        Health = false,
        PlayerList = true
    },

--===================================================================================================
--[ CAMERA ]=========================================================================================
--===================================================================================================

    camera = {
        cameraMode = Enum.CameraMode.Classic,
        cameraMaxZoomDistance = 15,
        cameraMinZoomDistance = 3
    },

--===================================================================================================
--[ MOUSE ]==========================================================================================
--===================================================================================================

    mouse = {
        enabled = true,
        toggleMouse = true,
        mouseKeyCode = Enum.KeyCode.LeftAlt
    },

--===================================================================================================
--[ CHARACTER ]======================================================================================
--===================================================================================================

    character = {
        characterMaxSlopeAngle = 50,
        characterWalkSpeed = 8
    },

    characterJumpSettings = {
        enabled = false,
        characterJumpHeight = 7.2,
        characterJumpPower = 50.0,
        characterUsJumpPower = true
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
                canManageServer = true,
                canManagePermissions = true,
                canAccessAdminPanel = true,
                canBanUser = true,
                canKickUser = true,
                canWarnUser = true,
                canShowLogs = true,
                canJoinTheServer = true,
            },

            [0] = {  -- Guest
                canManageServer = false,
                canManagePermissions = false,
                canAccessAdminPanel = false,
                canBanUser = false,
                canKickUser = false,
                canWarnUser = false,
                canShowLogs = false,
                canJoinTheServer = true,
            }
        }
    },

--===================================================================================================
--[ OTHER ]==========================================================================================
--===================================================================================================

    debugMode = true,
    version = "UNITE Engine 1.0 - R15"
}

return Configuration