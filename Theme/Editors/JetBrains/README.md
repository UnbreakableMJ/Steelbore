# Steelbore for JetBrains IDEs

This plugin implements the Steelbore Standard (Charcoal Navy, Midnight Blue, Vibrant Orange) across the entire JetBrains IDE interface.

## 📁 Source Structure
- `src/META-INF/plugin.xml`: Plugin descriptor.
- `src/steelbore.theme.json`: UI component color overrides.
- `src/steelbore.xml`: Editor color scheme.

## 🚀 How to Load / Test
1. Open **IntelliJ IDEA** (or any JetBrains IDE).
2. Go to **Settings** > **Plugins**.
3. Click the ⚙️ icon and select **Install Plugin from Disk...**.
4. To test during development without a JAR:
   - Use the **IntelliJ Platform Plugin Template** or **Gradle** to build the plugin.
   - Alternatively, you can point the IDE to the `src` directory if configured as a DevKit project.

## 🎨 Palette
- **Primary Background**: `#0E141D` (Charcoal Navy)
- **Secondary UI**: `#142E46` (Midnight Blue)
- **Accent**: `#FE6B00` (Vibrant Orange)
