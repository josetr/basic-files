# Basic Files

This repository contains basic example files.

## Structure

- Project folders contain small, conventional source trees for languages that are usually used as packages or applications.
- `projects/` contains multi-file examples that can be built or checked from the repository root.
- `standalone/` contains single-file syntax fixtures, including languages that also have project folders.

## Project examples

- `projects/cmake/` - C and CMake
- `projects/csharp/` - C#
- `projects/dart/` - Dart
- `projects/go/` - Go
- `projects/java/` - Java
- `projects/kotlin/` - Kotlin
- `projects/php/` - PHP
- `projects/python/` - Python
- `projects/ruby/` - Ruby
- `projects/rust/` - Rust
- `projects/swift/` - Swift
- `projects/todo-board/` - Browser todo board
- `projects/typescript/` - TypeScript
- `projects/web-app/` - Browser app
- `projects/zig/` - Zig

## Build project examples

The root CMake project builds or checks project examples with their native
toolchains. Tool-specific targets are enabled when the matching toolchain and
local dependencies are available.

```bash
cmake -S . -B build
cmake --build build
```

Use strict mode when missing toolchains should fail configuration:

```bash
cmake -S . -B build -DBASIC_FILES_STRICT_BUILDS=ON
```

## Standalone examples

The `standalone/` folder is the broad syntax coverage set for `two-face`. It contains small examples for programming languages, configuration files, markup, schemas, stylesheets, query languages, and editor/build formats.

## Coverage check

Run the local checker to verify which `two-face` grammar each standalone file
matches and which scopes are exercised:

```bash
cargo run --manifest-path tools/twoface-coverage/Cargo.toml -- standalone
```
