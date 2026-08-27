# Git Secrets Sentinel

A lightweight local Git pre-commit security scanner.

## Detects
- AWS access-key patterns
- Private-key headers
- Hardcoded password assignments
- Azure secret and token assignments
- Generic API key and token patterns

## Usage

    python sentinel.py

The scanner checks staged Git files and returns exit code 1 when a configured secret pattern is detected.
