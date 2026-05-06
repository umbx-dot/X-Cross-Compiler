# Multi-Architecture C Build System

## Overview

This project provides a Bash-based build system for compiling C source files across multiple CPU architectures. It consists of two scripts:

- `get_compilers.sh` — Downloads and installs the required cross-compilers
- `compile.sh` — Searches the current directory for all `.c` files, compiles them for multiple architectures, strips symbols, and compresses the resulting binaries with UPX

## Setup

After cloning the repository, run:

```bash
chmod +x get_compilers.sh
./get_compilers.sh
```

This script downloads and configures all required toolchains.

## Usage

Place `compile.sh` inside the directory containing your C source files, or execute it from that directory.

Run:

```bash
chmod +x compile.sh
./compile.sh
```

The script will automatically:

1. Detect all `.c` files in the current directory
2. Compile each file for every supported architecture
3. Strip symbols and unnecessary sections from the binaries
4. Compress binaries using UPX for reduced file size

## Supported Architectures

The following targets are supported:

- `x86_64`
- `aarch64`
- `armv4l`
- `armv5l`
- `armv6l`
- `armv7l`
- `mips`
- `mipsel`
- `mipsrouter`


## Requirements

- Linux-based operating system
- Bash

## Notes

- `get_compilers.sh` must be executed before using `compile.sh`
- Scripts assume a standard Linux environment
- Cross-compilers are installed and configured automatically by `get_compilers.sh`
