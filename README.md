# Multi-Architecture C Build System 

## Overview

This project provides a toolchain for compiling C source files across multiple CPU architectures. It consists of two scripts:

- `get_compilers.sh` — Downloads and prepares the required cross-compilers
- `compile.sh` — Compiles all `.c` files in a given directory for multiple architectures, then strips and compresses the resulting binaries

Produces:
x86_64
aarch64
armv4l
armv5l
armv6l
armv7l
mips
mipsel
mipsrouter

## Setup

After cloning the repository, run the following command to install all required toolchains:

```bash
chmod +x get_compilers.sh
./get_compilers.sh
