# 🌐 Supported Environments
Steelbore is designed to be a ubiquitous, cross-platform experience. It provides configurations and installation scripts for the following environments:

### Desktop Environments & Window Managers (Linux)
- **GNOME**: (GTK4/Libadwaita)
- **KDE Plasma**: `.colors` scheme
- **COSMIC DE**: `.ron` configuration
- **XFCE4 & MATE**: GTK3 overrides & Metacity/Xfwm4
- **LeftWM & Niri**: Tiling WM configurations

### Terminals & Shells
- **Starship Prompt**: Cross-shell configuration
- **POSIX Shells**: `bash`, `zsh`, `fish`, `csh`, `tcsh`
- **Modern Shells**: `nu`, `ion` (Redox OS)
- **Linux TTY**: TrueColor hex overrides

### Developer Tools & Applications
- **Editors**: VS Code, JetBrains IDEs
- **Browsers**: Chrome, Edge, Firefox
- **Productivity**: Microsoft Office (VBA Macros)
- **Deployment**: Flatpak, Snap, AppImage support

## 🚀 Installation Guide
We have provided automated POSIX-compliant shell scripts to deploy the theme across Linux/Unix systems, alongside manual templates for Windows and specialized software.

### 1. Linux / Unix (Automated)
The easiest way to apply Steelbore to your Linux desktop, window managers, and browsers is using the all-in-one script.

```bash
git clone https://github.com/YOUR_USERNAME/Steelbore.git
cd Steelbore/Scripts
./install-steelbore.sh
```

This script will:
- Install the **Steelbore GTK theme** (GNOME, XFCE, MATE, COSMIC).
- Apply the **.colors scheme** to KDE Plasma.
- Set up the **Starship prompt** configuration.
- Install **terminal color presets** (Alacritty, Kitty, Konsole, Windows Terminal).
- Apply **browser theme extensions** (Chrome, Edge, Firefox).
- Configure **LeftWM** and **Niri** tiling window managers.
- Apply **Linux TTY** TrueColor overrides.

## 🪟 Windows Installation
For Windows users, we provide:
- **Microsoft Office**: VBA macros to recolor Word, Excel, and PowerPoint.
- **Windows Terminal**: JSON templates for the Steelbore color scheme.

## 🛠️ Manual Installation
If you prefer to install components individually, follow the instructions below.
### Desktop Environments & Window Managers

#### GNOME (GTK4/Libadwaita)
1. Copy the `steelbore-dark` folder to `~/.themes/`.
2. Run: `gsettings set org.gnome.desktop.interface gtk-theme 'steelbore-dark'`

#### KDE Plasma
1. Copy the `steelbore.colors` file to `~/.local/share/color-schemes/`.
2. Go to **System Settings** > **Appearance** > **Colors** > **Import**.

#### COSMIC DE
1. Copy the `steelbore.ron` file to `~/.config/cosmic/themes/`.
2. Run: `cosmic-settings theme set steelbore`

#### XFCE4 & MATE
1. Copy the `steelbore-dark` folder to `~/.themes/`.
2. Run: `xfconf-query -c xsettings -p /Net/ThemeName -s "steelbore-dark"`

#### Tiling WMs (LeftWM/Niri)
- **LeftWM**: Copy `steelbore.toml` to `~/.config/leftwm/themes/`.
- **Niri**: Copy `steelbore.ron` to `~/.config/niri/themes/`.

### Terminals & Shells

#### Starship Prompt
Add the following to your shell profile (`~/.bashrc`, `~/.zshrc`, etc.):
```bash
eval "$(starship init bash)"
```

#### POSIX Shells (Bash, Zsh, Fish)
Source the `steelbore.sh` script in your shell profile:
```bash
source /path/to/Steelbore/Scripts/steelbore.sh
```

#### Nushell
Add to your `env.nu` or `config.nu`:
```nushell
source /path/to/Steelbore/Scripts/steelbore.nu
```

#### Ion (Redox OS)
Add to your `ion.rc`:
```bash
source /path/to/Steelbore/Scripts/steelbore.ion
```

#### Linux TTY
Run the TTY installation script:
```bash
sudo ./install-tty-colors.sh
```

### Developer Tools & Applications

#### VS Code
Install the **Steelbore** extension from the VS Code Marketplace.

#### JetBrains IDEs
1. Copy `steelbore.theme` to `~/.config/JetBrains/<VERSION>/colors/`.
2. Select it in **Settings** > **Editor** > **Color Scheme**.

#### Browsers (Chrome / Edge / Firefox)
Install the **Steelbore** theme from the respective extension stores (Chrome Web Store / Firefox Add-ons).

#### Microsoft Office (VBA)
1. Open Word/Excel/PowerPoint and press `Alt+F11`.
2. Insert a new module and paste the contents of `Steelbore-Office-Theme.bas`.
3. Run the `Apply_Steelbore_Theme` macro.

#### Sandboxed & Containerized Apps
- **Flatpak**: `flatpak override --user --env=GTK_THEME=steelbore-dark`
- **Snap**: `snap set-theme steelbore-dark`
- **AppImage**: Set `GTK_THEME=steelbore-dark` before execution.