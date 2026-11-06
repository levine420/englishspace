#!/bin/bash
# Script to add hamburger menu to all pages

files=("materials.html" "practice.html" "evaluation.html" "profile.html")

for file in "${files[@]}"; do
  echo "Updating $file..."
  
  # Add hamburger CSS in media query section (before closing })
  sed -i '' '/nav { display: none; }/a\
      \
      .hamburger { display: flex; }\
      \
      nav {\
        position: fixed;\
        top: 90px;\
        right: -100%;\
        width: 250px;\
        height: calc(100vh - 90px);\
        background: white;\
        flex-direction: column;\
        padding: 20px;\
        box-shadow: -2px 0 10px rgba(0,0,0,0.1);\
        transition: right 0.3s ease;\
        z-index: 999;\
      }\
      \
      nav.active {\
        right: 0;\
      }\
      \
      nav a {\
        padding: 15px 0;\
        border-bottom: 1px solid #E2E8F0;\
      }
' "$file"
  
  # Add hamburger icon to header
  sed -i '' 's/<\/nav>/<\/nav>\
    <div class="hamburger" onclick="toggleMenu()">\
      <span><\/span>\
      <span><\/span>\
      <span><\/span>\
    <\/div>/' "$file"
  
  # Add id to nav
  sed -i '' 's/<nav>/<nav id="mobileNav">/' "$file"
  
  # Add toggle function before </script>
  sed -i '' '/<\/script>/i\
    function toggleMenu() {\
      document.getElementById('"'"'mobileNav'"'"').classList.toggle('"'"'active'"'"');\
    }\
' "$file"
  
done

echo "Done! All pages updated with hamburger menu."
