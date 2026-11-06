#!/bin/bash
# Fix hamburger menu CSS in all pages

# File to update
files=("materials.html" "practice.html" "profile.html")

for file in "${files[@]}"; do
  echo "Processing $file..."
  
  # Check if hamburger CSS already exists in main section
  if ! grep -q "^    \.hamburger {" "$file"; then
    # Add hamburger styles after nav a:hover::after block
    sed -i '' '/nav a:hover::after, nav a.active::after {/,/width: 100%;/ {
      /width: 100%;/a\
    }\
    \
    .hamburger {\
      display: none;\
      flex-direction: column;\
      cursor: pointer;\
      gap: 5px;\
    }\
    \
    .hamburger span {\
      width: 25px;\
      height: 3px;\
      background: var(--text-main);\
      border-radius: 3px;\
      transition: all 0.3s ease;\
    }\
    \
    .hamburger span:first-child {\
      width: 25px;\
      height: 3px;\
      background: var(--text-main);\
      border-radius: 3px;\
    }\
    \
    .hamburger span:nth-child(2) {\
      width: 25px;\
      height: 3px;\
      background: var(--text-main);\
      border-radius: 3px;\
    }\
    \
    .hamburger span:last-child {\
      width: 25px;\
      height: 3px;\
      background: var(--text-main);\
      border-radius: 3px;\
    }\
    \
    .btn-header {
    }' "$file"
  fi
  
  # Check if hamburger styles exist in mobile media query
  if ! grep -q "hamburger { display: flex; }" "$file"; then
    echo "Missing mobile hamburger CSS"
  fi
done

echo "Done!"
