#!/system/bin/sh

# Function to write values to files with error handling
write() {
  local file="$1"
  local value="$2"

  if [ ! -f "$file" ]; then
    echo "Error: $file does not exist." >&2
    return 1
  fi

  chmod +w "$file" 2> /dev/null

  if ! echo "$value" > "$file" 2> /dev/null; then
    echo "Failed to write $value to $file" >&2
    return 1
  fi
}

# Sync before executing to avoid crashes
sync

# Set both up_rate_limit_us and down_rate_limit_us
for policy in /sys/devices/system/cpu/cpufreq/policy*; do
  write "$policy/schedutil/up_rate_limit_us" "5000"
  write "$policy/schedutil/down_rate_limit_us" "50000"
done

if [ $? -eq 0 ]; then
  # Log the script completion
  echo "Script completed successfully" >> /data/local/tmp/script_log.txt
else
  echo "Script encountered errors" >> /data/local/tmp/script_log.txt
fi

# Exit
exit 0
