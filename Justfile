target := "$HOME"

stow app rest="":
  stow -v -t {{target}} {{rest}} {{app}}

delete app rest="":
  stow -v -D -t {{target}} {{rest}} {{app}}
