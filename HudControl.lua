--[[
    HudControl
    Author:
        Museus (Discord: Museus#7777)

    Optionally toggle parts of the Hades HUD
]]
ModUtil.RegisterMod("HudControl")

local config = {
    Enabled = true,

    -- Enemies
    RemoveEnemyHealthBars = true,

    -- Zagreus
    RemoveZagreusHealthBars = true,
    RemoveZagreusCallMeter = true,
    RemoveZagreusRailAmmo = true,
    RemoveZagreusCasts = true,
    RemoveSideBar = true,

    -- Resources
    RemoveObols = true,
    RemoveNectar = true,
    RemoveDarkness = true,
    RemoveGems = true,
    RemoveKeys = true,
    RemoveTitansBlood = true,
    RemoveDiamonds = true,
    RemoveAmbrosia = true,
    RemoveRerolls = true,

    -- Information
    RemoveHeat = true,
}
HudControl.config = config

-- Define mapping of Resource names to config options
-- for use with the ShowResourceUI function wrapper
HudControl.ResourceConfigMap = {
    GiftPoints = "RemoveNectar",
    MetaPoints = "RemoveDarkness",
    Gems = "RemoveGems",
    LockKeys = "RemoveKeys",
    SuperLockKeys = "RemoveTitansBlood",
    SuperGems = "RemoveDiamonds",
    SuperGiftPoints = "RemoveAmbrosia"
}


-- Enemy Health Bars
-- Scripts/CombatPresentation.lua : 65
ModUtil.WrapBaseFunction("CreateHealthBar", function ( baseFunc, newEnemy )
    if config.Enabled and config.RemoveEnemyHealthBars then
        return
    end
    baseFunc( newEnemy )
end, HudControl)

-- Zagreus Health Bar
-- Scripts/UIScripts.lua : 434
ModUtil.WrapBaseFunction("ShowHealthUI", function ( baseFunc )
    if config.Enabled and config.RemoveZagreusHealthBars then
        return
    end

    baseFunc()
end, HudControl)

-- Zagreus Casts
-- Scripts/UIScripts.lua : 908
ModUtil.WrapBaseFunction("ShowAmmoUI", function ( baseFunc )
    if config.Enabled and config.RemoveZagreusCasts then
        return
    end

    baseFunc()
end, HudControl)

-- Zagreus Rail Ammo
-- Scripts/UIScripts.lua : 966
ModUtil.WrapBaseFunction("ShowGunUI", function ( baseFunc, gunData )
    if config.Enabled and config.RemoveZagreusRailAmmo then
        return
    end

    baseFunc( gunData )
end, HudControl)

-- Zagreus Call
-- Scripts/UIScripts.lua : 1061
ModUtil.WrapBaseFunction("ShowSuperMeter", function ( baseFunc )
    if config.Enabled and config.RemoveZagreusCallMeter then
        return
    end

    baseFunc()
end, HudControl)

-- Obols
-- Scripts/UIScripts.lua : 739
ModUtil.WrapBaseFunction("ShowMoneyUI", function ( baseFunc, offsetY )
    if config.Enabled and config.RemoveObols then
        return
    end

    baseFunc( offsetY )
end, HudControl)

-- Boons/Keepsake Sidebar
-- Scripts/UIScripts.lua : 1265
ModUtil.WrapBaseFunction("ShowTraitUI", function ( baseFunc )
    if config.Enabled and config.RemoveSideBar then
        return
    end

    baseFunc()
end, HudControl)

-- Active Heat
-- Scripts/UIScripts.lua : 2901
ModUtil.WrapBaseFunction("UpdateActiveShrinePoints", function ( baseFunc )
    if config.Enabled and config.RemoveHeat then
        if ScreenAnchors.ShrinePointIconId ~= nil then
            HideObstacle({ Id = ScreenAnchors.ShrinePointIconId, Duration = 0.2, IncludeText = true, })
        end
        return
    end

    baseFunc()
end, HudControl)

-- Available Rerolls
-- Scripts/UIScripts.lua : 684
ModUtil.WrapBaseFunction("ShowRerollUI", function ( baseFunc, offsetY )
    if config.Enabled and config.RemoveRerolls then
        return
    end

    baseFunc( offsetY )
end, HudControl)

-- Resources
-- Scripts/UIScripts.lua : 585
ModUtil.WrapBaseFunction("ShowResourceUI", function ( baseFunc, resourceName, offsetY, args )
    local resourceConfigOption = HudControl.ResourceConfigMap[resourceName]
    local shouldRemoveResource = HudControl.config[resourceConfigOption]
    if HudControl.config.Enabled and shouldRemoveResource then
        return
    end

    baseFunc( resourceName, offsetY, args )
end, HudControl)
