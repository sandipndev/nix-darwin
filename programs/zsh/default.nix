{config}: {
  enable = true;
  sessionVariables.EDITOR = "vim";
  sessionVariables.RPROMPT = "";
  sessionVariables.BASTION_USER = "sandipan_galoy_io";
  sessionVariables.CARGO_NET_GIT_FETCH_WITH_CLI = "true";

  initExtra = ''
    export XDG_CONFIG_HOME="/Users/''${USER}/.config"
    if [ -e "$HOME/.nix-defexpr/channels" ]; then
      export NIX_PATH="$HOME/.nix-defexpr/channels''${NIX_PATH:+:$NIX_PATH}"
    fi

    function p() { cd $(find ~/projects -maxdepth 3 -type d | sk) }
    ulimit -Sn 10240
  '';

  shellAliases = {
    ll = "ls -al";

    g = "git";
    gs = "git status";
    gb = "git branch";
    gl = "git log --oneline --graph --decorate --date=relative";

    sz = "source ~/.zshrc";
    eh = "vi ~/.config/nix-darwin/home.nix";
    ev = "vi ~/.config/nix-darwin/programs/neovim/default.nix";
    tf = "terraform";
    k = "kubectl";

    nix-update = "pushd ~/.config/nix-darwin; nix flake update; darwin-rebuild switch --flake ~/.config/nix-darwin; source ~/.zshrc; popd";
  };
}
