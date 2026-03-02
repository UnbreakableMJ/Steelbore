# Installing Steelbore Theme for Firefox

**Version:** 1.0 | **Author:** Mohamed Hammd | **License:** GPL3+ | **Website:** [steelbore.com](https://steelbore.com)

## Method 1: Install from XPI (Recommended)

1. Open Firefox.
2. Navigate to `about:addons` (or press `Ctrl+Shift+A`).
3. Click the gear icon ⚙️ → **Install Add-on From File…**
4. Select the `steelbore-firefox-theme.xpi` file.
5. Click **Add** when prompted.

## Method 2: Temporary Installation (Developer)

1. Open Firefox and navigate to `about:debugging#/runtime/this-firefox`.
2. Click **Load Temporary Add-on…**
3. Select the `manifest.json` file from the `steelbore-firefox/` folder.
4. The theme will be applied immediately (until browser restart).

## Method 3: Manual Permanent Installation

1. Navigate to `about:support` → **Profile Folder** → **Open Folder**.
2. Locate the `extensions/` directory (create it if it doesn't exist).
3. Copy the `steelbore-firefox-theme.xpi` file into the `extensions/` directory.
4. Rename it to `steelbore-theme@steelbore.com.xpi`.
5. Restart Firefox.
