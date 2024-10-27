{ username }: {
  "github.com" = {
    hostname = "github.com";
    user = "git";
    identityFile = "/Users/${username}/.ssh/ed25519";
    identitiesOnly = true;
  };
}
