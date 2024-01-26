Config = {}

-- Health threshold for triggering the knockout state.
-- When a player's health falls below this value, they will be knocked out.
Config.HealthThreshold = 60

-- Duration of invincibility after being knocked out, in milliseconds.
-- This prevents the player from receiving further damage immediately after being knocked out.
Config.InvincibilityTime = 5000

-- Recovery time after being knocked out, in seconds.
-- This is the period during which the player gradually regains health before fully reviving.
Config.RecoveryTime = 5

-- Amount of health recovered per second during the recovery phase.
-- This value determines how quickly a player recovers health after being knocked out.
Config.HealthRecovery = 2

-- Interval for checking the player's state, in milliseconds.
-- This sets how frequently the system checks if the player should be knocked out or revived.
Config.CheckInterval = 500

-- Translate Notify Here
Config.Notify = "You're knocked out!"
