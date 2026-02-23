# Steelbore Theme for Visual Studio (IDE)

Bring the industrial Steelbore aesthetic to Visual Studio 2022.

## Installation

### Manual Import
1. Open Visual Studio 2022.
2. Go to **Tools > Options**.
3. Navigate to **Environment > Fonts and Colors**.
4. Use the **Color Theme Designer** (if installed) to import the `Steelbore.vstheme` file.

### Packaging (VSIX)
To create a distributable `.vsix` package:
1. Open the [Color Theme Designer](https://marketplace.visualstudio.com/items?itemName=VisualStudioPlatformTeam.ColorThemeDesigner) extension in VS.
2. Create an **Empty VSIX Project**.
3. Add `Steelbore.vstheme` as an asset in the `source.extension.vsixmanifest`.
4. Build the project to generate the VSIX.

## Palette
- **Void Navy:** `#000027`
- **Molten Amber:** `#D98E32`
- **Steel Blue:** `#4B7EB0`
