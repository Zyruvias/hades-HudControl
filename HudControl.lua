--[[
    HudControl
    Author:
        Museus (Discord: Museus#7777)

    Optionally toggle parts of the Hades HUD
]]
ModUtil.RegisterMod("HudControl")

local config = {
    Enabled = true,
    RemoveEnemyHealthBars = true,
    RemoveZagreusHealthBars = true,
    RemoveZagreusCallMeter = true,
    RemoveZagreusRailAmmo = true,
    RemoveZagreusCasts = true,
    -- RemoveZagreusDeathDefiances = true,
    RemoveObols = true,
    RemoveSideBar = true,
    RemoveHeat = true,
    RemoveRerolls = true,
}
HudControl.config = config

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

