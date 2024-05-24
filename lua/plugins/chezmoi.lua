-- https://github.com/alker0/chezmoi.vim
return {
  "alker0/chezmoi.vim",
  lazy = false,
  init = function()
    -- This option is required.
    vim.g["chezmoi#use_tmp_buffer"] = true
    vim.g["chezmoi#source_dir_path"] = "~/.local/share/chezmoi"
  end,
}
