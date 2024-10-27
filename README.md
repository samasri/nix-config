# Nix Configuration

Nix configuration that I use to set up & manage my mac

## Installing on a Fresh Machine

1. Clone this repo to _~/.nix-config_
1. Edit [username and hostname](./flake.nix#L16) to have the hostname/username of your account and machine
1. Run: `nix run nix-darwin --experimental-features 'nix-command flakes' -- switch -v --flake ~/.nix-config`
1. Run: `darwin-rebuild switch -v --flake ~/.nix-config`
