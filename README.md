# ZIO-level Nix

Virtual environments for ZIO projects using Nix flakes.

## Quick Start

### Create a new ZIO library
```bash
nix flake init -t github:EstebanMarin/ziolevel-nix#library
nix develop
```

### Create a new ZIO application
```bash
nix flake init -t github:EstebanMarin/ziolevel-nix#application
nix develop
```

## Available Templates

- **library**: ZIO library project with JDK 17
- **application**: ZIO application project with JDK 21

## Tools Included

- Scala CLI
- SBT
- Metals (Scala LSP)
- Java (JDK 17 for libraries, JDK 21 for applications)

## Usage

Enter the development shell:
```bash
nix develop
```

All tools will be available with proper JAVA_HOME configuration.
