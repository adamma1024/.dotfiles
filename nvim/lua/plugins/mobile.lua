-- Mobile development: iOS (Swift) + Android (Kotlin)
return {
  -- Treesitter: Swift + Kotlin parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "swift",
        "kotlin",
        "xml", -- Android layouts
        "groovy", -- Gradle files
      },
    },
  },

  -- LSP: sourcekit-lsp (Swift) + kotlin-language-server
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Swift / iOS (sourcekit-lsp ships with Xcode)
        sourcekit = {
          cmd = {
            "xcrun",
            "sourcekit-lsp",
          },
          filetypes = { "swift", "objc", "objcpp" },
          root_dir = function(fname)
            local lspconfig = require("lspconfig")
            return lspconfig.util.root_pattern(
              "Package.swift",
              "*.xcodeproj",
              "*.xcworkspace",
              ".git"
            )(fname)
          end,
        },
        -- Kotlin / Android
        kotlin_language_server = {
          filetypes = { "kotlin" },
          root_dir = function(fname)
            local lspconfig = require("lspconfig")
            return lspconfig.util.root_pattern(
              "settings.gradle",
              "settings.gradle.kts",
              "build.gradle",
              "build.gradle.kts",
              ".git"
            )(fname)
          end,
        },
      },
    },
  },

  -- Mason: ensure Kotlin LSP is installed
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "kotlin-language-server",
      },
    },
  },
}
