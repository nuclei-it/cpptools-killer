#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
   >&2 echo "[-] This script must be run as root"
   exit 1
fi

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

>&2 echo "[*] Starting process watcher..."
nohup stap -g "${SCRIPT_DIR}/cpptools-killer.stp" &

>&2 echo "[*] Wait for the process watcher to spin up..."
sleep 10

>&2 echo "[*] Kill all existing processes..."
killall -9 cpptools || true

>&2 echo "[+] Done."
