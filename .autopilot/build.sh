#!/bin/bash

APP="turkapp2"
MAX_RETRY=3
COUNT=0

cd /opt/ai-factory/apps/$APP

while [ $COUNT -lt $MAX_RETRY ]
do
  echo "🚀 Build attempt $COUNT"

  git add .
  git commit -m "autopilot build $COUNT" || true
  git push

  eas build -p android --profile preview

  if [ $? -eq 0 ]; then
    echo "✅ BUILD SUCCESS"
    exit 0
  fi

  echo "❌ Build failed → triggering fix loop"

  # AI fix trigger placeholder
  node .autopilot/fix.js

  COUNT=$((COUNT+1))
done

echo "💥 Build failed after retries"
