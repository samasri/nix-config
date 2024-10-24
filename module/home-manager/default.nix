{ pkgs, ... }:
let
  username = "m1";
  name = "Samer Almasri";
  email = "almasri@ualberta.ca";
  bashConfigTerminal = builtins.readFile ../settings/bash-configure-terminal.sh;
  bashUtils = builtins.readFile ../settings/bash-utils.sh;
in
{
  home.stateVersion = "22.11";
  home.activation = {
    generateSshKey = ''
      KEY_PATH="$HOME/.ssh/ed25519";
      if [ -f "$KEY_PATH" ]; then
        echo "SSH key already exists at $KEY_PATH."
      else
        echo "SSH key not found. Generating a new SSH key..."
        run ${pkgs.openssh_hpn}/bin/ssh-keygen -t ed25519 -C "${email}" -f "$KEY_PATH" -N ""
      fi
    '';
  };

  programs.ssh = {
    enable = true;
    matchBlocks = import ../settings/ssh-matchblocks.nix;
    serverAliveInterval = 60;
    extraConfig = "StrictHostKeyChecking no";
  };
  programs.git = {
    enable = true;
    userName = name;
    userEmail = email;
    extraConfig.init.defaultBranch = "main";
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
    pkgs.vscode-extensions.jnoortheen.nix-ide
    # pkgs.vscode-extensions.xabikos.javaScriptSnippets
    # "nhedger.ts-esbuild-problem-matchers" # do I need this?
  ];
  programs.vscode.keybindings = import ../settings/vscode-keybindings.nix;
  programs.vscode.userSettings = import ../settings/vscode-settings.nix;
  # TODO: use pkgs.writeShellScriptBin to write `vscode` instead of adding it in bashrc

  programs.bash.enable = true;
  programs.bash.enableCompletion = true;
  programs.bash.historyControl = [ "ignoredups" "ignorespace" ];
  programs.bash.historyFileSize = 1000000;
  programs.bash.historySize = 100000;
  programs.bash.initExtra = ''
    ${bashConfigTerminal}
    ${bashUtils}
  '';

  targets.darwin.currentHostDefaults."com.apple.controlcenter".BatteryShowPercentage = true;
  # targets.darwin.currentHostDefaults."com.apple.controlcenter"."NSStatusItem Visible Battery" = true; # Not sure if this works
}
