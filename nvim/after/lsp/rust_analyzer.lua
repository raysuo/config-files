-- ┌──────────────────────────────┐
-- │ Rust Analyzer LSP Config     │
-- └──────────────────────────────┘
-- Rust language server

return {
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = {
        command = 'clippy',
        extraArgs = { '--all-targets', '--all-features' },
      },
      inlayHints = {
        enable = true,
      },
    },
  },
}
