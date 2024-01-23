local VORPcore = exports.vorp_core:GetCore()

function isPlayerKnockedOut(player)
  return Citizen.InvokeNative(0x4E209B2C1EAD5159, player) and not IsEntityDead(player)
end

function handleKnockout(player)
  VORPcore.NotifyBottomRight(Config.Notify, 4000)
  SetPedToRagdoll(player, Config.InvincibilityTime, Config.InvincibilityTime, 0, 0, 0, 0)
  Citizen.InvokeNative(0x4102732DF6B4005F, "DeathFailMP01")
  SetPlayerInvincible(PlayerId(), true)
end

function revivePlayer(player)
  SetPlayerInvincible(PlayerId(), false)
  ResetPedRagdollTimer(player)
  Citizen.InvokeNative(0xB4FD7446BAB2F394, "DeathFailMP01")
end
