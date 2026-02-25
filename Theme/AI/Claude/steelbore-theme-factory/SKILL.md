---
name: steelbore-theme-factory
description: A specialized tool for generating high-quality Steelbore-compliant themes for various IDEs, editors, and terminal environments. Use it when you need to extend Steelbore support to a new platform.
license: GPL-3.0-or-later
---

# Steelbore Theme Factory

## Overview

The Theme Factory is the central engine for creating and refining Steelbore themes. It ensures that every extension follows the "Steelbore Standard" for visual excellence.

**Keywords**: theme generation, IDE themes, editor colors, UI design, Steelbore standard, palette consistency, visual design factory

## Core Steelbore Palette

- **Background**: `#0E141D` (Deep Navy)
- **Foreground**: `#F0F0F0` (Off-White)
- **Accent (Primary)**: `#FE6B00` (Steel Orange)
- **Accent (Secondary)**: `#3B82F6` (Steel Blue)
- **Status/String**: `#10B981` (Steel Green)
- **Secondary BG**: `#142E46` (Bright Black/Navy)

## Usage

1. **Select a Target**: Identify the platform (e.g., VS Code, JetBrains, Terminal).
2. **Apply Standards**: Refer to `Steelbore-brand-guidelines` for typography and spacing.
3. **Generate Assets**: Use the defined palette to create configuration files (JSON, XML, etc.).
4. **Validation**: Each theme must be WOW-worthy and premium before versioning.

## Directory Structure

- `/themes`: Source definitions for different implementations.
- `/scripts`: (Future) Automation scripts for theme generation.
- `/templates`: Boilerplates for common IDE formats.

## Features

- **Palette Syncing**: Ensures all generated themes use identical hex codes.
- **Premium Aesthetics**: Enforces modern typography (Outfit/Roboto) and high-contrast accessibility.
- **Multi-Platform Support**: Extensible to any terminal or GUI application.
