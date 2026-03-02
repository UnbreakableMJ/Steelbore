# Installing Steelbore Theme for Google Antigravity

**Version:** 1.0 | **Author:** Mohamed Hammd | **License:** GPL3+ | **Website:** [steelbore.com](https://steelbore.com)

## Method 1: Install from VSIX

1. Open Antigravity (VS Code fork).
2. Open the Command Palette (`Ctrl+Shift+P`).
3. Type **Extensions: Install from VSIX…**
4. Select the `.vsix` file from this folder (generate one using Method 3 if needed).
5. Restart the editor when prompted.
6. Open Command Palette → **Preferences: Color Theme** → select **Steelbore (Antigravity)**.

## Method 2: Manual Installation

1. Copy the `steelbore-antigravity/` folder to the Antigravity extensions directory:
   - **Windows:** `%USERPROFILE%\.antigravity\extensions\` (or equivalent)
   - **macOS/Linux:** `~/.antigravity/extensions/`
2. Restart the editor.
3. Select the theme via **Preferences: Color Theme**.

## Method 3: Build VSIX

1. Install `vsce`: `npm install -g @vscode/vsce`
2. Run `vsce package` inside the `steelbore-antigravity/` folder.
3. Install the resulting `.vsix` using Method 1.
