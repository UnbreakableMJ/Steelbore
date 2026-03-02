# Installing Steelbore Theme for Android Studio

**Version:** 1.0 | **Author:** Mohamed Hammd | **License:** GPL3+ | **Website:** [steelbore.com](https://steelbore.com)

## Method 1: Install from JAR/ZIP (Recommended)

1. Open Android Studio.
2. Go to **Settings** → **Plugins** → ⚙️ gear icon → **Install Plugin from Disk…**
3. Select the `steelbore-androidstudio-theme.zip` (or `.jar`) file.
4. Restart Android Studio.
5. Go to **Settings** → **Appearance & Behavior** → **Appearance** → **Theme** → select **Steelbore Android**.

## Method 2: Manual Installation

1. Copy the contents of `src/` to a plugin directory.
2. Place in Android Studio's plugins folder:
   - **Windows:** `%APPDATA%\Google\AndroidStudio<version>\plugins\`
   - **macOS:** `~/Library/Application Support/Google/AndroidStudio<version>/plugins/`
   - **Linux:** `~/.local/share/Google/AndroidStudio<version>/plugins/`
3. Restart Android Studio.

## Method 3: Build and Publish

1. Use the [IntelliJ Plugin SDK](https://plugins.jetbrains.com/docs/intellij/) to build a distributable `.jar`.
2. Upload to the [JetBrains Marketplace](https://plugins.jetbrains.com/) (Android Studio plugins are hosted there).
