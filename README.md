# Sabaton bootloader

Sabaton is a Stivale2 bootloader targeting different aarch64 enviroments.

## Differences from stivale2
Due to the memory layout of aarch64 devices being so far from standardized, a few changes have been made:
* Your kernel has to be located in the top 2G.
* All your kernel sections need to be 64K aligned, you don't know the page size (4K, 16K or 64K) ahead of time.

Zig compiler support:
Oldest confirmed working compiler: 0.8.0-dev.2065+bc06e1982
Newest confirmed working compiler: 0.9.0-dev.185+e125ead2b
