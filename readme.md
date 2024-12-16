# Vintage Story Server

## Volumes

- `/data/server-file` Vintage Story server file

## Environment varibles

### Vintage Story 

#### Server configuration

- **SERVER_BRANCH** Name of the branch [stable|unstable] (default: stable)
- **SERVER_VERSION** Vintage Story server version
- **SERVER_PORT** Server port (default: 42420)
- **SERVER_NAME** Public name of your server
- **SERVER_DESCRIPTION** Public description of your server
- **SERVER_MOTD** The message shown to players when they join. Placeholder {0} will be replaced with Player's nickname
- **SERVER_MAX_CLIENTS** Maximum number of players
- **SERVER_PASSWORD** Password of your server used to connect to it
- **SERVER_WHITELIST** Whether to only allow whitelisted players to connect to your server
- **SERVER_PUBLIC** Show your server in public server listing
- **SERVER_SERVER_LANGUAGE** Determines language of server messages
- **SERVER_PVP** Allow PvP (default: true)
- **SERVER_FIRE_SPREAD** Allow fire spread (default: true)
- **SERVER_WORLD_SEED** World seed
- **$SERVER_DIE_ABOVE_MEMORY_USAGE** Maximum RAM usage in megabytes before the server shuts down. Warnings are issued at 90% of this value every 60 seconds. (default: 50000)

<details>
    <summary>World Configuration Variables</summary>

- **WORLDCONFIG_GAMEMODE** [survival, creative] (default: survival)
- **WORLDCONFIG_STARTING_CLIMATE** [hot, warm, temperate, cool, icy] (default: temperate)
- **WORLDCONFIG_SPAWN_RADIUS** [10000, 5000, 2500, 1000, 500, 250, 100, 50, 25, 0] (default: 50)
- **WORLDCONFIG_GRACE_TIMER** [10, 5, 4, 3, 2, 1, 0] (default: 0)
- **WORLDCONFIG_DEATH_PUNISHMENT** [drop, keep] (default: drop)
- **WORLDCONFIG_DROPPED_ITEMS_TIMER** [300, 600, 1200, 1800, 3600] (default: 600)
- **WORLDCONFIG_SEASONS** [enabled, spring, summer, fall, winter] (default: enabled)
- **WORLDCONFIG_PLAYERLIVES** [1, 2, 3, 4, 5, 10, 20, -1] (default: -1)
- **WORLDCONFIG_LUNG_CAPACITY** [10000, 20000, 30000, 40000, 60000, 120000, 3600000] (default: 40000)
- **WORLDCONFIG_DAYS_PER_MONTH** [30, 20, 12, 9, 6, 3] (default: 9)
- **WORLDCONFIG_HARSH_WINTERS** [true, false] (default: true)
- **WORLDCONFIG_BLOCK_GRAVITY** [sandgravel, sandgravelsoil] (default: sandgravel)
- **WORLDCONFIG_CAVE_INS** [off, on] (default: off)
- **WORLDCONFIG_ALLOW_UNDERGROUND_FARMING** [true, false] (default: false)
- **WORLDCONFIG_NO_LIQUID_SOURCE_TRANSPORT** [true, false] (default: false)
- **WORLDCONFIG_BODY_TEMPERATURE_RESISTANCE** [-40, -30, -25, -20, -15, -10, -5, 0, 5, 10, 15, 20] (default: 0)
- **WORLDCONFIG_CREATURE_HOSTILITY** [aggressive, passive, off] (default: aggressive)
- **WORLDCONFIG_CREATURE_STRENGTH** [4, 2, 1.5, 1, 0.5, 0.25] (default: 1)
- **WORLDCONFIG_CREATURE_SWIM_SPEED** [0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 3] (default: 2)
- **WORLDCONFIG_PLAYER_HEALTH_POINTS** [5, 10, 15, 20, 25, 30, 35] (default: 15)
- **WORLDCONFIG_PLAYER_HUNGER_SPEED** [2, 1.5, 1.25, 1, 0.75, 0.5, 0.25] (default: 1)
- **WORLDCONFIG_PLAYER_HEALTH_REGEN_SPEED** [2, 1.5, 1.25, 1, 0.75, 0.5, 0.25] (default: 1)
- **WORLDCONFIG_PLAYER_MOVE_SPEED** [2, 1.75, 1.5, 1.25, 1, 0.75] (default: 1.5)
- **WORLDCONFIG_FOOD_SPOIL_SPEED** [4, 3, 2, 1.5, 1.25, 1, 0.75, 0.5, 0.25] (default: 1)
- **WORLDCONFIG_SAPLING_GROWTH_RATE** [16, 8, 4, 2, 1.5, 1, 0.75, 0.5, 0.25] (default: 1)
- **WORLDCONFIG_TOOL_DURABILITY** [4, 3, 2, 1.5, 1.25, 1, 0.75, 0.5] (default: 1)
- **WORLDCONFIG_TOOL_MINING_SPEED** [3, 2, 1.5, 1.25, 1, 0.75, 0.5, 0.25] (default: 1)
- **WORLDCONFIG_PROPICK_NODE_SEARCH_RADIUS** [0, 2, 4, 6, 8] (default: 0)
- **WORLDCONFIG_MICROBLOCK_CHISELING** [off, stonewood, all] (default: stonewood)
- **WORLDCONFIG_ALLOW_COORDINATE_HUD** [true, false] (default: true)
- **WORLDCONFIG_ALLOW_MAP** [true, false] (default: true)
- **WORLDCONFIG_COLOR_ACCURATE_WORLDMAP** [true, false] (default: false)
- **WORLDCONFIG_LORE_CONTENT** [true, false] (default: true)
- **WORLDCONFIG_CLUTTER_OBTAINABLE** [ifrepaired, yes, no] (default: ifrepaired)
- **WORLDCONFIG_LIGHTNING_FIRES** [true, false] (default: false)
- **WORLDCONFIG_TEMPORAL_STABILITY** [true, false] (default: true)
- **WORLDCONFIG_TEMPORAL_STORMS** [off, veryrare, rare, sometimes, often, veryoften] (default: sometimes)
- **WORLDCONFIG_TEMPSTORM_DURATION_MUL** [2, 1.5, 1.25, 1, 0.75, 0.5, 0.25] (default: 1)
- **WORLDCONFIG_TEMPORAL_RIFTS** [off, invisible, visible] (default: visible)
- **WORLDCONFIG_TEMPORAL_GEAR_RESPAWN_USES** [-1, 20, 10, 5, 4, 3, 2, 1] (default: 1)
- **WORLDCONFIG_TEMPORAL_STORM_SLEEPING** [0, 1] (default: 1)
- **WORLDCONFIG_WORLD_CLIMATE** [realistic, patchy] (default: realistic)
- **WORLDCONFIG_LANDCOVER** [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.95, 1] (default: 1)
- **WORLDCONFIG_OCEANSCALE** [0.1, 0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2, 3, 4] (default: 1)
- **WORLDCONFIG_UPHEAVEL_COMMONNESS** [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1] (default: 0.3)
- **WORLDCONFIG_GEOLOGIC_ACTIVITY** [0, 0.05, 0.1, 0.2, 0.4] (default: 0.05)
- **WORLDCONFIG_LANDFORM_SCALE** [0.2, 0.4, 0.6, 0.8, 1.0, 1.2, 1.4, 1.6, 1.8, 2, 3] (default: 1.0)
- **WORLDCONFIG_WORLD_WIDTH** [8192000, 4096000, 2048000, 1024000, 600000, 512000, 384000, 256000, 102400, 51200, 25600, 10240, 5120, 1024, 512, 384, 256, 128, 64, 32 ] (default: 1024000)
- **WORLDCONFIG_WORLD_LENGTH** [8192000, 4096000, 2048000, 1024000, 600000, 512000, 384000, 256000, 102400, 51200, 25600, 10240, 5120, 1024, 512, 384, 256, 128, 64, 32 ] (default: 1024000)
- **WORLDCONFIG_WORLD_EDGE** [blocked, traversable ] (default: traversable)
- **WORLDCONFIG_POLAR_EQUATOR_DISTANCE** [800000, 400000, 200000, 100000, 50000, 25000, 15000, 10000, 5000] (default: 50000)
- **WORLDCONFIG_GLOBAL_TEMPERATURE** [4, 2, 1.5, 1, 0.75, 0.5, 0.25] (default: 1)
- **WORLDCONFIG_GLOBAL_PRECIPITATION** [4, 2, 1.5, 1, 0.5, 0.25, 0.1] (default: 1)
- **WORLDCONFIG_GLOBAL_FORESTATION** [1, 0.9, 0.75, 0.5, 0.25, 0, -0.25, -0.5, -0.75, -0.9, -1] (default: 0)
- **WORLDCONFIG_GLOBAL_DEPOSIT_SPAWN_RATE** [3, 2, 1.8, 1.6, 1.4, 1.2, 1, 0.8, 0.6, 0.4, 0.2] (default: 1)
- **WORLDCONFIG_SURFACE_COPPER_DEPOSITS** [1, 0.5, 0.2, 0.12, 0.05, 0.015, 0] (default: 0.12)
- **WORLDCONFIG_SURFACE_TIN_DEPOSITS** [0.5, 0.25, 0.12, 0.03, 0.014, 0.007, 0] (default: 0.007)
- **WORLDCONFIG_SNOW_ACCUM** [true, false] (default: true)
- **WORLDCONFIG_ALLOW_LAND_CLAIMING** [true, false] (default: true)
- **WORLDCONFIG_CLASS_EXCLUSIVE_RECIPES** [true, false] (default: true)
- **WORLDCONFIG_AUCTION_HOUSE** [true, false] (default: true)
</details> 

### System User

- **UID** User ID (default: 1000)
- **GID** Group ID (default: 1000)

# Expose

- 42420

# Docker Compose

Example of docker compose file

```yaml
version: "3.8"

services:
  vintage-story:
    container_name: vsserver
    image: pepecitron/vintagestory-server
    restart: unless-stopped
    stdin_open: true
    tty: true
    ports:
      - "42420:42420"
    volumes:
      - ./data:/data/server-file
```

# Help

## Server console

You need need `stdin_open` and `tty` to true in docker compose file.

To interact with the console, you need to attach to the container, replace <container_name> with your container name.

```docker attach <container_name>```

Use Control-p Control-q to detach.
