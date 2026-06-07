# Homebrew Tap for z9s

Custom Homebrew tap for installing [z9s](https://github.com/zerote/z9s) - a unified Kubernetes CLI with FluxCD support and metrics dashboard.

## Installation

```bash
# Add the tap
brew tap zerote/z9s

# Install z9s
brew install z9s

# Verify installation
z9s version
```

## Usage

```bash
# Start z9s
z9s

# View help
z9s --help
```

## Requirements

- **Go** (for building from source)
- **kubectl** (for Kubernetes interactions)

## Updates

```bash
# Update the tap
brew tap zerote/z9s --force

# Update z9s to latest version
brew upgrade z9s
```

## Uninstall

```bash
brew uninstall z9s
brew untap zerote/z9s
```

## Formula Details

The formula:
- Builds z9s from source using Go
- Sets version, commit, and build date information
- Installs the `z9s` binary to your PATH
- Requires `kubectl` as a runtime dependency

## Support

For issues with z9s, visit: https://github.com/zerote/z9s/issues

For issues with the homebrew formula, feel free to open an issue.
