{ self, nixpkgs }: { pkgs, ... }:
let
  username = "m1";
in
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages =
    [
      pkgs.vim
      pkgs.arc-browser
      pkgs.zoom-us
      pkgs.docker
      pkgs.kubectl
      pkgs.colima
      pkgs.k9s
      pkgs.nixpkgs-fmt
    ];
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.${username} = {
    home = "/Users/${username}";
    shell = pkgs.bash;
  };


  system.activationScripts.users.text = ''
    echo "Setting bash as default shell for user"
    dscl . -create /Users/${username} UserShell /run/current-system/sw/bin/bash
  '';

  system.defaults = {
    NSGlobalDomain.AppleShowAllExtensions = true;
    NSGlobalDomain.InitialKeyRepeat = 14;
    NSGlobalDomain.KeyRepeat = 1;
    NSGlobalDomain."com.apple.trackpad.scaling" = 1.5;
    finder.FXPreferredViewStyle = "Nlsv";
    finder._FXShowPosixPathInTitle = true;
    dock.autohide = true;
    # TODO control what shows in menu bar (top right)
    # TODO allow arc & zoom to share camera
    # TODO configure terminal profile
    CustomUserPreferences = import ../settings/system-defaults.nix;
  };

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  system.configurationRevision = self.rev or self.dirtyRev or null;
  services.nix-daemon.enable = true; # Auto upgrade nix package and the daemon service.
  system.stateVersion = 5;
  nix.settings.experimental-features = "nix-command flakes";
}
