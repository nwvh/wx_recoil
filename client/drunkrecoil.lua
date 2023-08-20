if wx.drunkAiming then
    local drunkAiming = false
    
    function Drunk()
        local playerPed = PlayerPedId()
        local playerId = PlayerId()
    
        local _, weapon = GetCurrentPedWeapon(playerPed,false)
        if not wx.whitelistedWeapons[weapon] then
            if IsPlayerFreeAiming(playerId) then
                if wx.hideCrosshair then
                    HideHudComponentThisFrame( 14 )
                end
                DrunkRecoil()
            elseif IsPedShooting(playerPed) then
                DrunkRecoil()
            else
                if drunkAiming then
                    drunkAiming = false
                    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
                end
            end
        end
    end
    
    function DrunkRecoil()
        if not drunkAiming then
            drunkAiming = true
            ShakeGameplayCam("DRUNK_SHAKE", wx.drunkAimingPower)
        end
    end
    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            local sleep = true
            if IsPedArmed(PlayerPedId(), 6) then
                sleep = false
                Drunk()
            end
            if sleep then
                Wait(1000)
            end
        end
    end)
end


