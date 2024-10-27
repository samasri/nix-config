{ pkgs, config, username, ... }:
let
  name = "Samer Almasri";
  email = "almasri@ualberta.ca";
  bashConfigTerminal = builtins.readFile ../settings/bash-configure-terminal.sh;
  bashUtils = builtins.readFile ../settings/bash-utils.sh;
in
{
  home = {
    stateVersion = "22.11";
    activation = {
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
    packages = [
      (pkgs.writeShellScriptBin "vscode" ''
        ${config.programs.vscode.package}/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron "$@"
      '')
    ];
  };

  programs = {
    ssh = {
      enable = true;
      matchBlocks = import ../settings/ssh-matchblocks.nix { inherit username; };
      serverAliveInterval = 60;
      extraConfig = "StrictHostKeyChecking no";
    };
    gpg.enable = true;
    git = {
      enable = true;
      userName = name;
      userEmail = email;
      extraConfig.init.defaultBranch = "main";
    };
    vscode = {
      enable = true;
      keybindings = import ../settings/vscode-keybindings.nix;
      userSettings = import ../settings/vscode-settings.nix;
      extensions = with pkgs.vscode-extensions; [
        alefragnani.bookmarks
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        dbaeumer.vscode-eslint
        eamodio.gitlens
        ms-vsliveshare.vsliveshare
        davidanson.vscode-markdownlint
        esbenp.prettier-vscode
        redhat.vscode-yaml
        jnoortheen.nix-ide
        # xabikos.javaScriptSnippets
        # "nhedger.ts-esbuild-problem-matchers" # do I need this?
      ];
    };
    bash = {
      enable = true;
      enableCompletion = true;
      historyControl = [ "ignoredups" "ignorespace" ];
      historyFileSize = 1000000;
      historySize = 100000;
      initExtra = ''
        ${bashConfigTerminal}
        ${bashUtils}
      '';
    };
  };


  targets.darwin.currentHostDefaults."com.apple.controlcenter".BatteryShowPercentage = true;
  # targets.darwin.currentHostDefaults."com.apple.controlcenter"."NSStatusItem Visible Battery" = true; # Not sure if this works
}
