return {
  "dense-analysis/ale",
  init = function()
    vim.g.ale_fixers = {
      ["*"] = { "remove_trailing_lines", "trim_whitespace" },
      javascript = { "prettier" },
      ruby = { "rubocop" }
    }
  end
}
