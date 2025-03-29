return {
  { "junegunn/fzf", build = "./install --all" },
  {
    "junegunn/fzf.vim",
    keys = {
      { "<leader>t", ":Files<CR>", desc = "FZF Files", mode = "n" }
    }
  },
}
