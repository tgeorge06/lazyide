# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Lazyide is a lightweight, simple terminal-native IDE built in Rust using ratatui. The goal is to be a little more than bare bones — keep things minimal and avoid over-engineering. Don't add heavy features or abstractions. It provides file tree navigation, text editing, LSP integration (rust-analyzer), syntax highlighting, code folding, project search (via ripgrep), and a theme system.

## Build & Run

```bash
cargo build            # Debug build
cargo build --release  # Release build
cargo run              # Run the application
cargo run -- <path>    # Open a specific project directory
```

Rust 2024 edition. No custom build scripts, no CI/CD.

## Architecture

**Single-file monolith:** The entire application is in `src/main.rs` (~4,800 lines). Key sections:

- **App struct** — Central application state: file tree, editor (tui-textarea), theme, LSP client, fs watcher, UI state
- **Main event loop** (`run()`) — Polls LSP, fs changes, autosave, then draws UI and handles input
- **LSP client** (`LspClient`) — Spawns rust-analyzer, handles completion, diagnostics, go-to-definition via stdin/stdout JSON-RPC
- **File tree** (`TreeItem`, `rebuild_tree()`, `walk_dir()`) — Recursive directory traversal, folders-first sorting
- **Syntax highlighting** — Lightweight per-language keyword/comment/string coloring for 11+ languages
- **Theme system** — 27 JSON theme files in `themes/`, loaded at startup, with live preview and persistence
- **Persistence** — `PersistedState` saves theme preference and pane widths to `~/.config/lazyide/state.json`; autosave buffers every 2 seconds

**Focus model:** `Focus` enum switches between `Tree` and `Editor` panes. Input handling branches on focus state.

**Key enums:** `Focus`, `SyntaxLang`, `TreeContextAction`, `EditorContextAction`

## External Tool Dependencies

- **rust-analyzer** — LSP server (resolved from multiple known paths including rustup and brew)
- **ripgrep (`rg`)** — Powers project-wide search (Ctrl+Shift+F)
- **System clipboard** — Via `arboard` crate

## Themes

`themes/*.json` — Each file defines background, foreground, accent, selection, border, and UI element colors. Parsed via `ThemeFile` struct with serde. Fallback to built-in dark theme if no files found.

## Key Constants

```
INLINE_GHOST_MIN_PREFIX: 3      // Min chars before showing inline completion
EDITOR_GUTTER_WIDTH: 4          // Line number gutter width
MIN_FILES_PANE_WIDTH: 18
MIN_EDITOR_PANE_WIDTH: 28
FS_REFRESH_DEBOUNCE_MS: 120
AUTOSAVE_INTERVAL_MS: 2000
```
