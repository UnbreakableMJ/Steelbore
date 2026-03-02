# Installing Steelbore Theme for Azure DevOps

**Version:** 1.0 | **Author:** Mohamed Hammd | **License:** GPL3+ | **Website:** [steelbore.com](https://steelbore.com)

## Method 1: Install from VSIX (Organization)

1. Go to your Azure DevOps organization's **Manage Extensions** page.
2. Click **Browse Marketplace** or **Upload extension**.
3. Upload the `SteelBore.steelbore-theme-1.0.0.vsix` file.
4. Install the extension to your organization.
5. The theme will become available under your Azure DevOps settings.

## Method 2: Publish to Azure DevOps Marketplace

1. Install the `tfx` CLI: `npm install -g tfx-cli`
2. Run `tfx extension create --manifest-globs vss-extension.json` inside this folder.
3. Upload the resulting `.vsix` to the [Azure DevOps Marketplace](https://marketplace.visualstudio.com/azuredevops).
4. Share or publish for public/private use.

## Method 3: Local Development

1. Install `tfx-cli`: `npm install -g tfx-cli`
2. Package: `tfx extension create --manifest-globs vss-extension.json`
3. Upload the `.vsix` to your Azure DevOps organization for testing.
