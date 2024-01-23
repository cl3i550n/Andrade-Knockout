Citizen.CreateThread(function()
    local knockedOut = false
    local wait = Config.RecoveryTime

    while true do
        local player = PlayerPedId()
        local currentHealth = GetEntityHealth(player) / 6

        if isPlayerKnockedOut(player) then
            if currentHealth < Config.HealthThreshold and not knockedOut then
                handleKnockout(player)
                knockedOut = true
            end
        end

        if knockedOut then
            Citizen.Wait(1000)
            if not IsEntityDead(player) then
                if wait > 0 then
                    wait = wait - 1
                    SetEntityHealth(player, GetEntityHealth(player) + Config.HealthRecovery)
                else
                    knockedOut = false
                    wait = Config.RecoveryTime
                    revivePlayer(player)
                end
            else
                SetPlayerInvincible(PlayerId(), false)
            end
        else
            Citizen.Wait(Config.CheckInterval)
        end
    end
end)
