if status is-interactive
  # Disable the default fish greeting
  set fish_greeting

  # Use atuin for history
  atuin init fish | source

  # Add orbstack to the PATH if the system has it
  if test -d ~/.orbstack/bin
    source ~/.orbstack/shell/init2.fish 2>/dev/null || :
  end
end
