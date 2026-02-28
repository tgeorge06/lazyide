#!/bin/sh
# Record the lazyide demo — sets up state then runs VHS
set -eu

# Pre-set narrow file pane and starting theme
mkdir -p ~/.config/lazyide
cat > ~/.config/lazyide/state.json << 'EOF'
{"theme_name":"One Dark Pro","files_pane_width":28,"word_wrap":false}
EOF

# Clean autosave
rm -f ~/.config/lazyide/autosave/*.autosave

# Record
vhs demo.tape

echo "Done! Output: demo.gif + demo.mp4"
