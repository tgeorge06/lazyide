# lazyide — 10s loop demo
Output demo.gif
Output demo.mp4

Set Shell "bash"
Set FontSize 15
Set Width 1400
Set Height 900
Set Padding 0
Set Framerate 30
Set TypingSpeed 30ms
Set PlaybackSpeed 1

# --- Hidden setup ---
Hide
Type "rm -f ~/.config/lazyide/autosave/*.autosave"
Enter
Sleep 200ms
Type "export TERM=xterm-256color"
Enter
Sleep 200ms
Type@1ms "export PATH=/Users/tgeorge/.rustup/toolchains/stable-aarch64-apple-darwin/bin:$PATH"
Enter
Sleep 200ms
Type "clear"
Enter
Sleep 200ms
Type@1ms "./target/release/lazyide ~/demo-project"
Enter
Sleep 2s
# Navigate to src/handlers/auth.rs
Down 2
Sleep 50ms
Right
Sleep 100ms
Down
Sleep 50ms
Right
Sleep 100ms
Down
Sleep 50ms
Enter
Sleep 1s
Show

# ═══════════════════════════════════════════════
# Start: file tree + auth.rs in One Dark Pro
# ═══════════════════════════════════════════════
Sleep 400ms

# Scroll through code — syntax + brackets
Down 6
Sleep 50ms
Down 6
Sleep 50ms
Down 6
Sleep 50ms
Down 6
Sleep 50ms
Down 6
Sleep 50ms
Down 6
Sleep 50ms
Sleep 300ms

# Hide tree for full editor
Ctrl+b
Sleep 400ms

# Fold all / unfold
Ctrl+u
Sleep 600ms
Ctrl+u
Sleep 600ms

# Project search
Ctrl+Shift+f
Sleep 300ms
Type "login"
Sleep 200ms
Enter
Sleep 500ms
Enter
Sleep 400ms

# Theme switch: One Dark Pro → Warp Dark (6 down)
Ctrl+p
Sleep 300ms
Type "theme"
Sleep 150ms
Enter
Sleep 300ms
Down
Sleep 300ms
Down
Sleep 300ms
Down
Sleep 300ms
Down
Sleep 300ms
Down
Sleep 300ms
Down
Sleep 300ms
Enter
Sleep 600ms

# Hold final frame on Warp Dark
Sleep 500ms
