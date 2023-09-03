#!/bin/bash

# ANSI color escape codes
RED='\033[0;31m'  # Red
NC='\033[0m'      # No color

platforms=("android" "ios")
deeplink=""

usage() {
  echo -e "\nUsage: ./deeplink [-p android|ios] -d deeplink"
  echo -e "  -p: Specify the platform (optional, default: both)"
  echo -e "  -d: Specify the deep link"
  echo -e "  -h: Display this help message"
  exit 1
}

error() {
  echo -e "${RED}Error: $1${NC}" >&2
  usage
}

while getopts ":p:d:h" opt; do
  case $opt in
    p)
      platforms=("$OPTARG")
      ;;
    d)
      deeplink="$OPTARG"
      ;;
    h)
      usage
      ;;
    \?)
      error "Invalid option: -$OPTARG"
      ;;
    :)
      error "Option -$OPTARG requires an argument."
      ;;
  esac
done

if [ -z "$deeplink" ]; then
  error "Missing -d (deeplink) argument."
fi

for platform in "${platforms[@]}"; do
  case "$platform" in
    "android")
      # Check if adb exists
      if ! command -v adb &> /dev/null; then
        error "'adb' is not installed. Please install the Android SDK Platform Tools."
      fi

      # Dispatch the deep link to Android using adb
      adb shell am start -a android.intent.action.VIEW -d "$deeplink"
      ;;
    "ios")
      # Check if xcrun exists
      if ! command -v xcrun &> /dev/null; then
        error "'xcrun' is not installed. Please install Xcode."
      fi

      # Dispatch the deep link to iOS using xcrun
      xcrun simctl openurl booted "$deeplink"
      ;;
    *)
      error "Invalid platform. Please specify 'android' or 'ios' as the platform."
      ;;
  esac
done
