{ config, pkgs, ... }:

{
  imports = [
    ./categories.nix
    ./fonts.nix
  ];

  environment.systemPackages = with pkgs; [
    # Core essentials not included in categories
    git
    vim
    wget
    curl

    # SerenityOS Automation
    (writeShellScriptBin "serenity-dev" ''
      BASE_DIR="$HOME/Development/SerenityOS"
      REPO_URL="https://github.com/SerenityOS/serenity.git"

      mkdir -p "$HOME/Development"

      if [ ! -d "$BASE_DIR" ]; then
        echo "🚀 Initializing SerenityOS environment..."
        git clone "$REPO_URL" "$BASE_DIR"
      else
        echo "✅ SerenityOS repository found at $BASE_DIR"
      fi

      echo "🔮 Entering SerenityOS Build Environment (Nix Flake)..."
      echo "👉 To build and run: ./Meta/serenity.sh run"
      
      cd "$BASE_DIR"
      exec nix develop
    '')
  ];
}
