{ self, nixpkgs }: { pkgs, ... }:
let
  username = "m1";
in
{
  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };
  nix.settings.experimental-features = "nix-command flakes";

  environment.systemPackages = with pkgs; [
    vim
    arc-browser
    zoom-us
    docker
    kubectl
    colima
    k9s
    nixpkgs-fmt
  ];

  users.users.${username} = {
    home = "/Users/${username}";
    shell = pkgs.bash;
  };

  system = {
    configurationRevision = self.rev or self.dirtyRev or null;
    stateVersion = 5;
    activationScripts.users.text = ''
      echo "Setting bash as default shell for user"
      dscl . -create /Users/${username} UserShell /run/current-system/sw/bin/bash
    '';
    defaults = {
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        InitialKeyRepeat = 14;
        KeyRepeat = 1;
        "com.apple.trackpad.scaling" = 1.5;
        AppleInterfaceStyle = "Dark";
      };
      finder = {
        FXPreferredViewStyle = "Nlsv";
        _FXShowPosixPathInTitle = true;
      };
      dock.autohide = true;
      # TODO configure terminal profile
      CustomUserPreferences = import ../settings/system-defaults.nix;
    };
  };

  services.nix-daemon.enable = true; # Auto upgrade nix package and the daemon service.
}
