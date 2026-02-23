# Contributing to Steelbore
Welcome to the Steelbore project! We appreciate your interest in contributing. To maintain the highest levels of security, performance, and user respect, all contributions must strictly adhere to the Steelbore Standard outlined below.

By submitting a Pull Request, you agree to abide by these guidelines.

## 🛡️ The Steelbore Standard: Core Priorities
Every line of code and design choice must be evaluated against these three uncompromising priorities:

1. Memory-Safety (MSL): Memory-Safe Languages are mandatory. Rust is our primary and preferred language. If an alternative language must be used (e.g., Flutter/Dart or Zig), you must implement hardened memory-safety measures, strictly enforcing ASLR (Address Space Layout Randomization) and CFI (Control-Flow Integrity).

2. Extreme Performance: Software must be built with maximum efficiency in mind. We target CachyOS-level optimized compilation (e.g., LTO, x86-64-v3/v4 optimizations where applicable).

3. Hardened Security: Security is never an afterthought. All code must integrate aggressive hardening patches to mitigate vulnerabilities at the compiler and application level.

## 📜 Licensing & Open Source
License: All contributions must be licensed under the GPLv3+ (GNU General Public License v3.0 or later).

SPDX Headers: Every source file must include an accurate [SPDX (Software Package Data Exchange) identifier](https://spdx.dev/) at the top (e.g., `// SPDX-License-Identifier: GPL-3.0-or-later`).

## 💻 Engineering & Code Standards

### Rust Guidelines
For all Rust contributions, you must strictly follow the [Pragmatic Rust Guidelines](https://microsoft.github.io/rust-guidelines).

### POSIX Compliance
All shell scripts (installers, automation, wrappers) must be strictly POSIX-compliant. Do not use "bashisms" or shell-specific extensions unless explicitly writing a module for that specific shell. Test scripts against sh and dash.

### Universal Standards
- **Dates & Times**: All logs, timestamps, and UI elements must use the ISO 8601 format (`YYYY-MM-DD` and `HH:MM:SS`).
- **Measurements**: The Metric system is mandatory. Do not use imperial units in code, documentation, or the UI.

## 🔒 Privacy Friendly App (PFA) Principles
Steelbore respects the user. Any application, script, or extension built under this standard must be a PFA:

- **No Tracking or Ads**: The software must absolutely not contain any advertising, telemetry, analytics, or tracking mechanisms. User data is never shared with third parties.
- **Minimal Permissions**: Request only the absolute minimum OS or browser permissions required for the tool to function.
- **Local Storage Only**: All user data, configurations, and state must be saved locally. No forced cloud syncing or remote data storage.
- **Open Source**: The entirety of the source code must remain publicly available for audit under the GPLv3 license.

## 🎨 UI/UX & Design
When contributing UI elements, themes, or front-end code, the following standards apply:

### Visual Language
- **Material Design**: UI architecture and component layouts must follow the principles of Material Design (grid systems, elevation, spacing) while utilizing the Steelbore "Void Navy" industrial palette.
- **Accessibility**: All color combinations must be strictly WCAG compliant for contrast ratios to prevent eye strain and ensure legibility.

### Fonts
Only completely Free and Open Source (FOSS) fonts are permitted in the UI. Allowed licenses include:

- SIL Open Font License (OFL)
- Apache License
- Ubuntu Font License
- Creative Commons Zero v1.0 Universal (CC0)
(Recommendation: We prefer fonts sourced via Google Fonts that meet the above criteria, such as JetBrains Mono or Consolas-alternatives).

### Input & Navigation
Key Bindings: Applications must support a dual-navigation approach:

- **CUA (Common User Access)**: Standard system shortcuts (e.g., `Ctrl+C`, `Ctrl+V`, `Ctrl+S`).
- **Vim-like Bindings**: Keyboard-driven navigation (e.g., `h`, `j`, `k`, `l` for movement) for power users.

## 🛠️ Pull Request Process
1. Fork the repository and create your branch from `main`.
2. Ensure your code adheres to every point of the Steelbore Standard above.
3. If you've added or changed scripts, verify they are POSIX compliant.
4. Make sure your commit messages are clear, descriptive, and reference any relevant issue numbers.
5. Submit your PR with a detailed summary of your changes. Ensure the SPDX identifier is present in any new files.

By building to the Steelbore standard, we create tools that are unbreakable, private, and fiercely efficient. Thank you for contributing.