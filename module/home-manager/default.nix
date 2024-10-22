{ pkgs, ... }: {
  home.stateVersion = "22.11";
  programs.git = {
    enable = true;
    userName = "Samer Almasri";
    userEmail = "almasri@ualberta.ca";
    extraConfig.init.defaultBranch = "main";
    # TODO: find a way to sign by default
  };
  programs.vscode.enable = true;
  programs.vscode.extensions = [
    pkgs.vscode-extensions.alefragnani.bookmarks
    pkgs.vscode-extensions.ms-vscode-remote.remote-ssh
    pkgs.vscode-extensions.ms-vscode-remote.remote-ssh-edit
    pkgs.vscode-extensions.dbaeumer.vscode-eslint
    pkgs.vscode-extensions.eamodio.gitlens
    pkgs.vscode-extensions.ms-vsliveshare.vsliveshare
    pkgs.vscode-extensions.davidanson.vscode-markdownlint
    pkgs.vscode-extensions.esbenp.prettier-vscode
    pkgs.vscode-extensions.redhat.vscode-yaml
    # pkgs.vscode-extensions.xabikos.javaScriptSnippets
    # "nhedger.ts-esbuild-problem-matchers" # do I need this?
  ];
  programs.vscode.keybindings = import ../vscode-settings/keybindings.nix;
  programs.vscode.userSettings = import ../vscode-settings/settings.nix;

  targets.darwin.currentHostDefaults."com.apple.controlcenter".BatteryShowPercentage = true;
  # targets.darwin.currentHostDefaults."com.apple.controlcenter"."NSStatusItem Visible Battery" = true; # Not sure if this works
}
