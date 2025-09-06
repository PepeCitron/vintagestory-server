#!/usr/bin/env bash

# send_vs_command.sh - Send commands to Vintage Story server running in Docker
# Usage: ./send_vs_command.sh [OPTIONS] <command>

set -euo pipefail

# Configuration
CONTAINER_NAME="vsserver"
USER="vintagestory"
SCREEN_SESSION="vsserver"
LOG_FILE="/tmp/vsserver.log"
LOG_LINES=20

# Function to display help
show_help() {
    cat << EOF
Vintage Story Server Command Sender

USAGE:
    $0 [OPTIONS] <command>

DESCRIPTION:
    Sends commands to a Vintage Story server running in a Docker container
    and displays the recent server output.

OPTIONS:
    -h, --help          Show this help message
    -c, --container     Container name (default: $CONTAINER_NAME)
    -u, --user          Username in container (default: $USER)
    -s, --session       Screen session name (default: $SCREEN_SESSION)
    -l, --lines         Number of log lines to show (default: $LOG_LINES)
    -v, --verbose       Show verbose output

EXAMPLES:
    $0 "\"/help\""
    $0 "\"/webcartographer export\""
EOF
}

# Function to log messages
log() {
    local level=$1
    shift
    local message="$*"

    case $level in
        "INFO")
            echo -e "[INFO] $message" >&2
            ;;
        "WARN")
            echo -e "[WARN] $message" >&2
            ;;
        "ERROR")
            echo -e "[ERROR] $message" >&2
            ;;
        "DEBUG")
            if [[ "${VERBOSE:-false}" == "true" ]]; then
                echo -e "[DEBUG] $message" >&2
            fi
            ;;
    esac
}

check_container() {
    # is the container running?
    if ! docker ps --format "table {{.Names}}" | grep -q "^$CONTAINER_NAME$"; then
        log "ERROR" "Container '$CONTAINER_NAME' is not running or does not exist"
        log "INFO" "Available containers:"
        docker ps --format "table {{.Names}}\t{{.Status}}"
        exit 1
    fi
}

send_command() {
    local cmd="$1"

    log "DEBUG" "Sending command to container: $CONTAINER_NAME"
    log "DEBUG" "Command: $cmd"

    # Send the vintage story command to the screen session
    if ! docker exec "$CONTAINER_NAME" su "$USER" -s /bin/sh -p -c "screen -S $SCREEN_SESSION -p 0 -X stuff \"$cmd\$(printf '\r')\""; then
        log "ERROR" "Failed to send command to server"
        exit 1
    fi

    # Wait a moment for the command to process
    sleep 1

    # Capture screen output to log file
    if ! docker exec "$CONTAINER_NAME" su "$USER" -s /bin/sh -p -c "screen -S $SCREEN_SESSION -p 0 -X hardcopy -h $LOG_FILE"; then
        log "ERROR" "Failed to capture server output"
        exit  Server1
    fi

    # Display recent log output
    log "INFO" "Server response (last $LOG_LINES lines):"
    echo "----------------------------------------"
    docker exec "$CONTAINER_NAME" su "$USER" -s /bin/sh -p -c "tail -n $LOG_LINES $LOG_FILE" || {
        log "ERROR" "Failed to read server log"
        exit 1
    }
    echo "----------------------------------------"
}

VERBOSE=false
COMMAND=""

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -c|--container)
            CONTAINER_NAME="$2"
            shift 2
            ;;
        -u|--user)
            USER="$2"
            shift 2
            ;;
        -s|--session)
            SCREEN_SESSION="$2"
            shift 2
            ;;
        -l|--lines)
            if ! [[ "$2" =~ ^[0-9]+$ ]]; then
                log "ERROR" "Lines argument must be a positive number"
                exit 1
            fi
            LOG_LINES="$2"
            shift 2
            ;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        -*)
            log "ERROR" "Unknown option: $1"
            log "INFO" "Use --help for usage information"
            exit 1
            ;;
        *)
            COMMAND="$1"
            shift
            ;;
    esac
done

if [[ -z "$COMMAND" ]]; then
    log "ERROR" "No command specified"
    log "INFO" "Use --help for usage information"
    exit 1
fi

main() {
    log "DEBUG" "Container: $CONTAINER_NAME"
    log "DEBUG" "User: $USER"
    log "DEBUG" "Screen session: $SCREEN_SESSION"

    check_container
    send_command "$COMMAND"

    log "INFO" "Command sent to Vintage Story server successfully"
}

main
