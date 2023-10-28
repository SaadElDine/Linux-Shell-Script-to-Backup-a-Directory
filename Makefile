# Makefile for running ass1.sh with arguments

# Default target
.PHONY: default
default: backup

# Target to execute the backup script with specified parameters
backup:
	./ass1.sh a b 10 6

# You can change the parameters above to match your specific configuration{\rtf1}