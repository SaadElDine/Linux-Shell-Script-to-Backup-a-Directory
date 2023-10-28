# Linux-Shell-Script-to-Backup-a-Directory
A Bash script for creating backups of a source directory into a destination directory at regular intervals.

## Features

- Monitors changes in a source directory.
- Creates backups with timestamps when changes are detected.
- Retains a specified number of backup copies.
- run in background using crontab 

## Getting Started

Follow these instructions to set up and use the backup script.

### Prerequisites

- Bash shell
- Linux or macOS (may work on other Unix-like systems)
- Permissions to read, write, and execute in source and destination directories

### Installation

1. Clone or download this project to your local machine.
2. Place the `backup.sh` script and the provided `Makefile` in a directory of your choice.
