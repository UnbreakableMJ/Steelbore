# Steelbore Azure DevOps Theme

Port of the Steelbore aesthetic to Azure DevOps.

## Packaging

To package this extension for your organization:

1. Install `tfx-cli`:
   ```bash
   npm install -g tfx-cli
   ```

2. Package the extension:
   ```bash
   tfx extension create --manifest-globs vss-extension.json
   ```

3. Upload the generated `.vsix` to your [Azure DevOps Marketplace Management console](https://marketplace.visualstudio.com/manage).

## Palette
- **Void Navy:** `#000027`
- **Molten Amber:** `#D98E32`
- **Steel Blue:** `#4B7EB0`
