# ZIO-level Nix

Virtual environments for ZIO projects using Nix flakes.

## Quick Start

### Create a new ZIO library
```bash
nix develop github:EstebanMarin/ziolevel-nix#library
```

### Create a new ZIO application
```bash
nix develop github:EstebanMarin/ziolevel-nix#app
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
nix develop .#library
```


