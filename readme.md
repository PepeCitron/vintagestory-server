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

<details>
    <summary>World Configuration Variables</summary>

- **WORLDCONFIG_WORLD_CLIMATE** [realistic|patchy] (default: realistic)
- **WORLDCONFIG_GAMEMODE** [survival|creative] (default: survival)
- **WORLDCONFIG_TEMPORAL_STABILITY** [true|false] (default: true)
- **WORLDCONFIG_TEMPORAL_STORMS** [off|veryrare|rare|sometimes|often|veryoften] (default: sometimes)
- **WORLDCONFIG_GRACE_TIMER** [number] (default: 0)
- **WORLDCONFIG_MICROBLOCK_CHISELING** [off|stonewood|all] (default: stonewood)
- **WORLDCONFIG_POLAR_EQUATOR_DISTANCE**  (default: 100000)
- **WORLDCONFIG_LUNG_CAPACITY** [number] (default: 40000)
- **WORLDCONFIG_HARSH_WINTERS** [true|false] (default: true)
- **WORLDCONFIG_DAYS_PER_MONTH** [1-9] (default: 9)
- **WORLDCONFIG_SAPLING_GROWTH_RATE** [0.1-20] (default: 2)
- **WORLDCONFIG_PROPICK_NODE_SEARCH_RADIUS** [0-12] (default: 6)
- **WORLDCONFIG_ALLOW_UNDERGROUND_FARMING** [true|false] (default: false)
- **WORLDCONFIG_TEMPORAL_GEAR_RESPAWN_USES** [-1 .. 9999] (default: 20)
- **WORLDCONFIG_TEMPORAL_STORM_SLEEPING** [0|1] (default: 0)
- **WORLDCONFIG_STARTING_CLIMATE** [icy|cool|temperate|warm|hot] (default: temperate)
- **WORLDCONFIG_SPAWN_RADIUS** [number] (default: 50)
- **WORLDCONFIG_DEATH_PUNISHMENT** [drop|keep] (default: drop)
- **WORLDCONFIG_SEASONS** [enabled|spring] (default: enabled)
- **WORLDCONFIG_PLAYER_LIVES** [-1 .. 99] (default: -1)
- **WORLDCONFIG_BLOCK_GRAVITY** [sandgravel|sandgravelsoil] (default: sandgravel)
- **WORLDCONFIG_BODY_TEMPERATURE_RESISTANCE** [-40 .. 40] (default: 0)
- **WORLDCONFIG_CREATURE_HOSTILITY** [aggressive|passive|off] (default: aggressive)
- **WORLDCONFIG_CREATURE_STRENGTH** [0-99] (default: 1)
- **WORLDCONFIG_PLAYER_HEALTH_POINTS** [1-999] (default: 15)
- **WORLDCONFIG_PLAYER_HUNGER_SPEED** [0-10] (default: 1)
- **WORLDCONFIG_PLAYER_MOVE_SPEED** [0-10] (default: 1.5)
- **WORLDCONFIG_FOOD_SPOIL_SPEED** [0-10] (default: 1)
- **WORLDCONFIG_TOOL_DURABILITY** [0-99] (default: 1)
- **WORLDCONFIG_TOOL_MINING_SPEED** [0-99] (default: 1)
- **WORLDCONFIG_GLOBAL_DEPOSIT_SPAWN_RATE** [0.1-5] (default: 1)
- **WORLDCONFIG_ALLOW_COORDINATE_HUD** [true|false] (default: true)
- **WORLDCONFIG_ALLOW_MAP** [true|false] (default: true)
- **WORLDCONFIG_LORE_CONTENT** [true|false] (default: true)
- **WORLDCONFIG_TEMPSTORM_DURATION_MUL** [number] (default: 1)
- **WORLDCONFIG_TEMPORAL_RIFTS** [off|invisible|visible] (default: visible)
- **WORLDCONFIG_LANDCOVER** [0-1] (default: 1)
- **WORLDCONFIG_OCEANSCALE** [0-1] (default: 1)
- **WORLDCONFIG_UPHEAVEL_COMMONNESS** [0-1] (default: 0.3)
- **WORLDCONFIG_GEOLOGIC_ACTIVITY** [0|0.05|0.1|0.2|0.4] (default: 0.05)
- **WORLDCONFIG_LANDFORM_SCALE** [0.5-1.5] (default: 1.0)
- **WORLDCONFIG_WORLD_EDGE** [blocked|traversable] (default: traversable)
- **WORLDCONFIG_GLOBAL_TEMPERATURE** [0-5] (default: 1)
- **WORLDCONFIG_GLOBAL_PRECIPITATION** [0-5] (default: 1)
- **WORLDCONFIG_GLOBAL_FORESTATION** [-1 .. 1] (default: 0)
- **WORLDCONFIG_SURFACE_COPPER_DEPOSITS** [0-5]  (default: 0.12)
- **WORLDCONFIG_SURFACE_TIN_DEPOSITS** [0-5] (default: 0.007)
- **WORLDCONFIG_SNOW_ACCUM** [true|false] (default: true)
- **WORLDCONFIG_ALLOW_LAND_CLAIMING** [true|false] (default: true)
- **WORLDCONFIG_CLASS_EXCLUSIVE_RECIPES** [true|false] (default: true)
- **WORLDCONFIG_AUCTION_HOUSE** [true|false] (default: true)
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
