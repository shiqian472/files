#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 port_number"
  exit 1
fi

PORT=$1
PID=$(sudo lsof -t -i:$PORT)

if [ -z "$PID" ]; then
  echo "No process found on port $PORT"
else
  echo "Killing process $PID on port $PORT"
  sudo kill -9 $PID
fi