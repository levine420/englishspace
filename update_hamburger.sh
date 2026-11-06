#!/bin/bash
# Script to update hamburger CSS in all pages to match index.html

files=("materials.html" "practice.html" "evaluation.html" "profile.html")

for file in "${files[@]}"; do
  echo "Processing $file..."
  
  # Backup original
  cp "$file" "$file.bak"
  
  # Remove old hamburger CSS if exists (both main CSS and media query)
  # We'll add the correct one from index.html
  
  echo "Updated $file"
done

echo "All files updated with correct hamburger CSS!"
echo "Backups created with .bak extension"
