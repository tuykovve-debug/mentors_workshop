#!/bin/bash
for file in *; do
  lower=$(echo "$file" | tr 'A-Z' 'a-z')
  if [ "$file" != "$lower" ]; then
    mv "$file" "$lower"
  fi
done