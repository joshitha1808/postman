#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
env_file="$repo_root/.env"

if [[ ! -f "$env_file" ]]; then
  echo "Missing .env at $env_file"
  echo "Create it from .env.example"
  exit 1
fi

read_env() {
  local key="$1"
  # Supports KEY=value and ignores comments/blank lines
  local line
  line="$(grep -E "^${key}=" "$env_file" | tail -n 1 || true)"
  if [[ -z "$line" ]]; then
    echo ""
    return 0
  fi
  echo "${line#*=}"
}

android_key="$(read_env "GOOGLE_MAPS_ANDROID_API_KEY")"
ios_key="$(read_env "GOOGLE_MAPS_IOS_API_KEY")"

if [[ -z "$android_key" ]]; then
  echo "GOOGLE_MAPS_ANDROID_API_KEY is missing in .env"
  exit 1
fi

if [[ -z "$ios_key" ]]; then
  echo "GOOGLE_MAPS_IOS_API_KEY is missing in .env"
  exit 1
fi

# Android: write to android/local.properties (non-committed)
android_local_props="$repo_root/android/local.properties"
mkdir -p "$(dirname "$android_local_props")"

tmpfile="$(mktemp)"
if [[ -f "$android_local_props" ]]; then
  # Remove existing MAPS_API_KEY line(s)
  grep -vE '^MAPS_API_KEY=' "$android_local_props" > "$tmpfile" || true
fi
{
  cat "$tmpfile" 2>/dev/null || true
  echo "MAPS_API_KEY=$android_key"
} > "$android_local_props"
rm -f "$tmpfile"

# iOS: write xcconfig that is included by Debug/Release
ios_xcconfig="$repo_root/ios/Flutter/MapsKeys.xcconfig"
cat > "$ios_xcconfig" <<EOF
// Generated from .env by tooling/sync_maps_keys.sh
MAPS_API_KEY=$ios_key
EOF

echo "Wrote: $android_local_props"
echo "Wrote: $ios_xcconfig"
