#!/bin/sh

# Ensure User and Group IDs
if [ ! "$(id -u vintagestory)" -eq "$UID" ]; then usermod -o -u "$UID" vintagestory ; fi
if [ ! "$(id -g vintagestory)" -eq "$GID" ]; then groupmod -o -g "$GID" vintagestory ; fi

# Apply server configuration
serverconfig="/data/server-file/serverconfig.json"

if [ ! -f serverconfig ]; then
cp /data/default-serverconfig.json /data/server-file/serverconfig.json
fi

jq '.Port = $val' --arg val "$SERVER_PORT" $serverconfig | sponge $serverconfig

if [ -n "$SERVER_NAME" ]; then jq '.ServerName = $val' --arg val "$SERVER_NAME" $serverconfig | sponge $serverconfig ; fi
if [ -n "$SERVER_DESCRIPTION" ]; then jq '.ServerDescription = $val' --arg val "$SERVER_DESCRIPTION" $serverconfig | sponge $serverconfig ; fi
if [ -n "$SERVER_MOTD" ]; then jq '.WelcomeMessage = $val' --arg val "$SERVER_MOTD" $serverconfig | sponge $serverconfig ; fi
if [ -n "$SERVER_MAX_CLIENTS" ]; then jq '.MaxClients = $val' --arg val "$SERVER_MAX_CLIENTS" $serverconfig | sponge $serverconfig ; fi
if [ -n "$SERVER_PASSWORD" ]; then jq '.Password = $val' --arg val "$SERVER_PASSWORD" $serverconfig | sponge $serverconfig ; fi
if [ -n "$SERVER_WHITELIST" ]; then jq '.OnlyWhitelisted = $val' --arg val "$SERVER_WHITELIST" $serverconfig | sponge $serverconfig ; fi
if [ -n "$SERVER_PUBLIC" ]; then jq '.AdvertiseServer = $val' --arg val "$SERVER_PUBLIC" $serverconfig | sponge $serverconfig ; fi
if [ -n "$SERVER_SERVER_LANGUAGE" ]; then jq '.ServerLanguage = $val' --arg val "$SERVER_SERVER_LANGUAGE" $serverconfig | sponge $serverconfig ; fi
if [ -n "$SERVER_PVP" ]; then jq '.AllowPvP = $val' --arg val "$SERVER_PVP" $serverconfig | sponge $serverconfig ; fi
if [ -n "$SERVER_FIRE_SPREAD" ]; then jq '.AllowFireSpread = $val' --arg val "$SERVER_FIRE_SPREAD" $serverconfig | sponge $serverconfig ; fi
if [ -n "$SERVER_WORLD_SEED" ]; then jq '.WorldConfig.Seed = $val' --arg val "$SERVER_WORLD_SEED" $serverconfig | sponge $serverconfig ; fi

# Apply World Configuration
if [ -n "$WORLDCONFIG_WORLD_CLIMATE" ]; then jq '.WorldConfig.WorldConfiguration.worldClimate = $val' --arg val "$WORLDCONFIG_WORLD_CLIMATE" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_GAMEMODE" ]; then jq '.WorldConfig.WorldConfiguration.gameMode = $val' --arg val "$WORLDCONFIG_GAMEMODE" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_TEMPORAL_STABILITY" ]; then jq '.WorldConfig.WorldConfiguration.temporalStability = $val' --arg val "$WORLDCONFIG_TEMPORAL_STABILITY" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_TEMPORAL_STORMS" ]; then jq '.WorldConfig.WorldConfiguration.temporalStorms = $val' --arg val "$WORLDCONFIG_TEMPORAL_STORMS" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_GRACE_TIMER" ]; then jq '.WorldConfig.WorldConfiguration.graceTimer = $val' --arg val "$WORLDCONFIG_GRACE_TIMER" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_MICROBLOCK_CHISELING" ]; then jq '.WorldConfig.WorldConfiguration.microblockChiseling = $val' --arg val "$WORLDCONFIG_MICROBLOCK_CHISELING" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_POLAR_EQUATOR_DISTANCE" ]; then jq '.WorldConfig.WorldConfiguration.polarEquatorDistance = $val' --arg val "$WORLDCONFIG_POLAR_EQUATOR_DISTANCE" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_LUNG_CAPACITY" ]; then jq '.WorldConfig.WorldConfiguration.lungCapacity = $val' --arg val "$WORLDCONFIG_LUNG_CAPACITY" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_HARSH_WINTERS" ]; then jq '.WorldConfig.WorldConfiguration.harshWinters = $val' --arg val "$WORLDCONFIG_HARSH_WINTERS" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_DAYS_PER_MONTH" ]; then jq '.WorldConfig.WorldConfiguration.daysPerMonth = $val' --arg val "$WORLDCONFIG_DAYS_PER_MONTH" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_SAPLING_GROWTH_RATE" ]; then jq '.WorldConfig.WorldConfiguration.saplingGrowthRate = $val' --arg val "$WORLDCONFIG_SAPLING_GROWTH_RATE" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_PROPICK_NODE_SEARCH_RADIUS" ]; then jq '.WorldConfig.WorldConfiguration.propickNodeSearchRadius = $val' --arg val "$WORLDCONFIG_PROPICK_NODE_SEARCH_RADIUS" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_ALLOW_UNDERGROUND_FARMING" ]; then jq '.WorldConfig.WorldConfiguration.allowUndergroundFarming = $val' --arg val "$WORLDCONFIG_ALLOW_UNDERGROUND_FARMING" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_TEMPORAL_GEAR_RESPAWN_USES" ]; then jq '.WorldConfig.WorldConfiguration.temporalGearRespawnUses = $val' --arg val "$WORLDCONFIG_TEMPORAL_GEAR_RESPAWN_USES" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_TEMPORAL_STORM_SLEEPING" ]; then jq '.WorldConfig.WorldConfiguration.temporalStormSleeping = $val' --arg val "$WORLDCONFIG_TEMPORAL_STORM_SLEEPING" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_STARTING_CLIMATE" ]; then jq '.WorldConfig.WorldConfiguration.startingClimate = $val' --arg val "$WORLDCONFIG_STARTING_CLIMATE" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_SPAWN_RADIUS" ]; then jq '.WorldConfig.WorldConfiguration.spawnRadius = $val' --arg val "$WORLDCONFIG_SPAWN_RADIUS" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_DEATH_PUNISHMENT" ]; then jq '.WorldConfig.WorldConfiguration.deathPunishment = $val' --arg val "$WORLDCONFIG_DEATH_PUNISHMENT" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_SEASONS" ]; then jq '.WorldConfig.WorldConfiguration.seasons = $val' --arg val "$WORLDCONFIG_SEASONS" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_PLAYER_LIVES" ]; then jq '.WorldConfig.WorldConfiguration.playerlives = $val' --arg val "$WORLDCONFIG_PLAYER_LIVES" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_BLOCK_GRAVITY" ]; then jq '.WorldConfig.WorldConfiguration.blockGravity = $val' --arg val "$WORLDCONFIG_BLOCK_GRAVITY" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_BODY_TEMPERATURE_RESISTANCE" ]; then jq '.WorldConfig.WorldConfiguration.bodyTemperatureResistance = $val' --arg val "$WORLDCONFIG_BODY_TEMPERATURE_RESISTANCE" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_CREATURE_HOSTILITY" ]; then jq '.WorldConfig.WorldConfiguration.creatureHostility = $val' --arg val "$WORLDCONFIG_CREATURE_HOSTILITY" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_CREATURE_STRENGTH" ]; then jq '.WorldConfig.WorldConfiguration.creatureStrength = $val' --arg val "$WORLDCONFIG_CREATURE_STRENGTH" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_PLAYER_HEALTH_POINTS" ]; then jq '.WorldConfig.WorldConfiguration.playerHealthPoints = $val' --arg val "$WORLDCONFIG_PLAYER_HEALTH_POINTS" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_PLAYER_HUNGER_SPEED" ]; then jq '.WorldConfig.WorldConfiguration.playerHungerSpeed = $val' --arg val "$WORLDCONFIG_PLAYER_HUNGER_SPEED" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_PLAYER_MOVE_SPEED" ]; then jq '.WorldConfig.WorldConfiguration.playerMoveSpeed = $val' --arg val "$WORLDCONFIG_PLAYER_MOVE_SPEED" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_FOOD_SPOIL_SPEED" ]; then jq '.WorldConfig.WorldConfiguration.foodSpoilSpeed = $val' --arg val "$WORLDCONFIG_FOOD_SPOIL_SPEED" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_TOOL_DURABILITY" ]; then jq '.WorldConfig.WorldConfiguration.toolDurability = $val' --arg val "$WORLDCONFIG_TOOL_DURABILITY" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_TOOL_MINING_SPEED" ]; then jq '.WorldConfig.WorldConfiguration.toolMiningSpeed = $val' --arg val "$WORLDCONFIG_TOOL_MINING_SPEED" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_GLOBAL_DEPOSIT_SPAWN_RATE" ]; then jq '.WorldConfig.WorldConfiguration.globalDepositSpawnRate = $val' --arg val "$WORLDCONFIG_GLOBAL_DEPOSIT_SPAWN_RATE" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_ALLOW_COORDINATE_HUD" ]; then jq '.WorldConfig.WorldConfiguration.allowCoordinateHud = $val' --arg val "$WORLDCONFIG_ALLOW_COORDINATE_HUD" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_ALLOW_MAP" ]; then jq '.WorldConfig.WorldConfiguration.allowMap = $val' --arg val "$WORLDCONFIG_ALLOW_MAP" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_LORE_CONTENT" ]; then jq '.WorldConfig.WorldConfiguration.loreContent = $val' --arg val "$WORLDCONFIG_LORE_CONTENT" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_TEMPSTORM_DURATION_MUL" ]; then jq '.WorldConfig.WorldConfiguration.tempstormDurationMul = $val' --arg val "$WORLDCONFIG_TEMPSTORM_DURATION_MUL" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_TEMPORAL_RIFTS" ]; then jq '.WorldConfig.WorldConfiguration.temporalRifts = $val' --arg val "$WORLDCONFIG_TEMPORAL_RIFTS" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_LANDCOVER" ]; then jq '.WorldConfig.WorldConfiguration.landcover = $val' --arg val "$WORLDCONFIG_LANDCOVER" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_OCEANSCALE" ]; then jq '.WorldConfig.WorldConfiguration.oceanscale = $val' --arg val "$WORLDCONFIG_OCEANSCALE" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_UPHEAVEL_COMMONNESS" ]; then jq '.WorldConfig.WorldConfiguration.upheavelCommonness = $val' --arg val "$WORLDCONFIG_UPHEAVEL_COMMONNESS" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_GEOLOGIC_ACTIVITY" ]; then jq '.WorldConfig.WorldConfiguration.geologicActivity = $val' --arg val "$WORLDCONFIG_GEOLOGIC_ACTIVITY" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_LANDFORM_SCALE" ]; then jq '.WorldConfig.WorldConfiguration.landformScale = $val' --arg val "$WORLDCONFIG_LANDFORM_SCALE" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_WORLD_EDGE" ]; then jq '.WorldConfig.WorldConfiguration.worldEdge = $val' --arg val "$WORLDCONFIG_WORLD_EDGE" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_GLOBAL_TEMPERATURE" ]; then jq '.WorldConfig.WorldConfiguration.globalTemperature = $val' --arg val "$WORLDCONFIG_GLOBAL_TEMPERATURE" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_GLOBAL_PRECIPITATION" ]; then jq '.WorldConfig.WorldConfiguration.globalPrecipitation = $val' --arg val "$WORLDCONFIG_GLOBAL_PRECIPITATION" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_GLOBAL_FORESTATION" ]; then jq '.WorldConfig.WorldConfiguration.globalForestation = $val' --arg val "$WORLDCONFIG_GLOBAL_FORESTATION" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_SURFACE_COPPER_DEPOSITS" ]; then jq '.WorldConfig.WorldConfiguration.surfaceCopperDeposits = $val' --arg val "$WORLDCONFIG_SURFACE_COPPER_DEPOSITS" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_SURFACE_TIN_DEPOSITS" ]; then jq '.WorldConfig.WorldConfiguration.surfaceTinDeposits = $val' --arg val "$WORLDCONFIG_SURFACE_TIN_DEPOSITS" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_SNOW_ACCUM" ]; then jq '.WorldConfig.WorldConfiguration.snowAccum = $val' --arg val "$WORLDCONFIG_SNOW_ACCUM" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_ALLOW_LAND_CLAIMING" ]; then jq '.WorldConfig.WorldConfiguration.allowLandClaiming = $val' --arg val "$WORLDCONFIG_ALLOW_LAND_CLAIMING" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_CLASS_EXCLUSIVE_RECIPES" ]; then jq '.WorldConfig.WorldConfiguration.classExclusiveRecipes = $val' --arg val "$WORLDCONFIG_CLASS_EXCLUSIVE_RECIPES" $serverconfig | sponge $serverconfig ; fi
if [ -n "$WORLDCONFIG_AUCTION_HOUSE" ]; then jq '.WorldConfig.WorldConfiguration.auctionHouse = $val' --arg val "$WORLDCONFIG_AUCTION_HOUSE" $serverconfig | sponge $serverconfig ; fi

# Start server
echo "Launching server..."
cd /data
su vintagestory -s /bin/sh -p -c "dotnet VintagestoryServer.dll --dataPath /data/server-file"
