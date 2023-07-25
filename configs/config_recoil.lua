wx = {}

wx.hideCrosshair = true -- Hide builtin GTA crosshair while aiming?
wx.drunkAiming = true -- Enable "drunk" aiming?
wx.verticalRecoil = true -- Enable realistic vertical recoil while shooting?
wx.disableAimPunching = true -- Disables punching with [R] and other keys while aiming
wx.disableHeadshots = true -- Disables one-shots to head

wx.drunkAimingPower = 0.65 -- Higher number = Higher screen shake

wx.whitelistedWeapons = { -- These weapons will have NO recoil effects
    [`WEAPON_SNIPERRIFLE`] = true,
    [`WEAPON_HEAVYSNIPER`] = true,
    [`WEAPON_HEAVYSNIPER_MK2`] = true,
    [`WEAPON_MARKSMANRIFLE`] = true,
    [`WEAPON_MARKSMANRIFLE_MK2`] = true,
    [`WEAPON_MUSKET`] = false,
}

wx.recoilMultipliers = { -- [ONLY FOR VERTICAL RECOIL] Edit the power of the recoil for each weapon type
--              0.0 = none (default)
    ["PISTOL"] = 0.3,
    ["SMG"] = 0.8,
    ["RIFLE"] = 1.3,
    ["LMG"] = 1.6,
    ["SHOTGUN"] = 2.3,
    ["SNIPER"] = 5.5,

    ["VEHICLE"] = 0.8 -- Recoil while in vehicle
}