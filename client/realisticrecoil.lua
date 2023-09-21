if wx.verticalRecoil then
  Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
            local ped = PlayerPedId()
            if wx.disableHeadshots then
                SetPedSuffersCriticalHits(ped, false)
            end
            if IsPedArmed(ped, 4) and wx.disableAimPunching then
                DisableControlAction(1, 140, true)
                DisableControlAction(1, 141, true)
                DisableControlAction(1, 142, true)
            end
            
            if IsPedShooting(ped) then      
                local Vehicled = IsPedInAnyVehicle(ped, false)
                local MovementSpeed = math.ceil(GetEntitySpeed(ped))

                Citizen.Wait(1)
                local _,wep = GetCurrentPedWeapon(ped,false)
                local group = GetWeapontypeGroup(wep)
                local p = GetGameplayCamRelativePitch()
                local recoil = math.random(10,100+MovementSpeed)/80
                local pistol = false
                local smg = false
                local rifle = false
                local shotgun = false
                local sniper = false
                local lmg = false
                if group == 970310034 then rifle = true
                elseif group == 416676503 then pistol = true
                elseif group == -957766203 then smg = true
                elseif group == 1159398588 then lmg = true
                elseif group == 3082541095 or group == 2725924767 then sniper = true
                elseif group == 860033945 then shotgun = true end
                if Vehicled then
                    recoil = recoil * wx.recoilMultipliers["VEHICLE"]
                end
                if pistol then recoil = recoil * wx.recoilMultipliers["PISTOL"]
                elseif smg then recoil = recoil * wx.recoilMultipliers["SMG"]
                elseif rifle then recoil = recoil * wx.recoilMultipliers["RIFLE"]
                elseif shotgun then recoil = recoil * wx.recoilMultipliers["SHOTGUN"]
                elseif lmg then recoil = recoil * wx.recoilMultipliers["LMG"]
                elseif sniper then recoil = recoil * wx.recoilMultipliers["SNIPER"]
                end
                local set = p+recoil
		if not wx.whitelistedWeapons[GetHashKey(_wep)] then
                	SetGameplayCamRelativePitch(set,0.8)
		end
            end
    end
        
	end)
end
