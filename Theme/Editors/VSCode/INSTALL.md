# Installing Steelbore Theme for Visual Studio Code

**Version:** 1.0 | **Author:** Mohamed Hammd | **License:** GPL3+ | **Website:** [steelbore.com](https://steelbore.com)

## Method 1: Install from VSIX (Recommended)

1. Open VS Code.
2. Open the Command Palette (`Ctrl+Shift+P`).
3. Type **Extensions: Install from VSIX…**
4. Select the `steelbore-1.0.0.vsix` file from this folder.
5. Restart VS Code when prompted.
6. Open Command Palette → **Preferences: Color Theme** → select **Steelbore**.

## Method 2: Manual Installation

1. Copy the entire `steelbore-theme/` folder to your VS Code extensions directory:
   - **Windows:** `%USERPROFILE%\.vscode\extensions\`
   - **macOS:** `~/.vscode/extensions/`
   - **Linux:** `~/.vscode/extensions/`
2. Restart VS Code.
3. Open Command Palette → **Preferences: Color Theme** → select **Steelbore**.

## Method 3: Package and Publish

1. Install `vsce`: `npm install -g @vscode/vsce`
2. Run `vsce package` inside the `steelbore-theme/` folder.
3. Upload the `.vsix` to the [VS Code Marketplace](https://marketplace.visualstudio.com/).
