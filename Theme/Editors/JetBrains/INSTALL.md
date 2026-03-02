# Installing Steelbore Theme for JetBrains IDEs

**Version:** 1.0 | **Author:** Mohamed Hammd | **License:** GPL3+ | **Website:** [steelbore.com](https://steelbore.com)

Supports: IntelliJ IDEA, RustRover, GoLand, PyCharm, WebStorm, CLion, Rider, and all JetBrains IDEs.

## Method 1: Install from JAR/ZIP (Recommended)

1. Open your JetBrains IDE.
2. Go to **Settings** → **Plugins** → ⚙️ gear icon → **Install Plugin from Disk…**
3. Select the `steelbore-jetbrains-theme.zip` (or `.jar`) file.
4. Restart the IDE.
5. Go to **Settings** → **Appearance & Behavior** → **Appearance** → **Theme** → select **Steelbore**.

## Method 2: Manual Installation

1. Copy the contents of `src/` to a plugin directory:
   - Ensure `META-INF/plugin.xml` and theme files are at the correct paths.
2. Place in your IDE's plugins folder:
   - **Windows:** `%APPDATA%\JetBrains\<IDE>\plugins\`
   - **macOS:** `~/Library/Application Support/JetBrains/<IDE>/plugins/`
   - **Linux:** `~/.local/share/JetBrains/<IDE>/plugins/`
3. Restart the IDE.

## Method 3: Build and Publish

1. Use the [IntelliJ Plugin SDK](https://plugins.jetbrains.com/docs/intellij/) to build a distributable `.jar`.
2. Upload to the [JetBrains Marketplace](https://plugins.jetbrains.com/).
