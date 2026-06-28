#!/bin/bash

echo "🔍 Precheck running..."

node -c App.js
if [ $? -ne 0 ]; then
  echo "❌ Syntax error detected"
  exit 1
fi

echo "✅ Precheck OK"
