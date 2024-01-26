local VORPcore = exports.vorp_core:GetCore()

function isPlayerKnockedOut(player)
  local attackerPed = GetPedSourceOfDeath(player)
  local isNPC = IsEntityAPed(attackerPed) and not IsPedAPlayer(attackerPed)
  local isPlayer = IsPedAPlayer(attackerPed)
  local isPlayerUnarmed = wasUnarmedAtTime(attackerPed)
  local isPedInMeleeCombat = Citizen.InvokeNative(0x4E209B2C1EAD5159, player) == 1
  local isDead = IsEntityDead(player)

  return isPedInMeleeCombat and not isDead and isPlayerUnarmed and (isPlayer or isNPC)
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

function wasUnarmedAtTime(player)
  local retval, weaponHash = GetCurrentPedWeapon(player, true)
  return retval and weaponHash == GetHashKey('WEAPON_UNARMED')
end
