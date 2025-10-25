#!/bin/bash
# Usage: ./run_with_display.sh "command_to_run" "process_name"

COMMAND="$1"
PROCESS_NAME="$2"

if [ -z "$COMMAND" ] || [ -z "$PROCESS_NAME" ]; then
  echo "Usage: $0 \"command_to_run\" \"process_name\""
  exit 1
fi

# --- GUI environment setup (for Flatpak or GUI apps) ---
export DISPLAY=:0
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"

LOGFILE="$HOME/watchdog.log"

# --- Check if process with that name is already running ---
if pgrep -x "$PROCESS_NAME" >/dev/null 2>&1; then
  echo "$(date): Process '$PROCESS_NAME' already running, skipping start." >> "$LOGFILE"
  exit 0
fi

# --- Start the process detached ---
echo "$(date): Starting process '$PROCESS_NAME' -> $COMMAND" >> "$LOGFILE"
nohup bash -c "$COMMAND" >> "$LOGFILE" 2>&1 &
PID=$!
echo "$(date): Started '$PROCESS_NAME' with PID $PID" >> "$LOGFILE"
