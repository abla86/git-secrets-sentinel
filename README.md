# Git Secrets Sentinel

Lightweight Git pre-commit security scanner for detecting common accidental secret leaks.

## Features

- AWS access-key detection
- Private-key detection
- Hardcoded password detection
- Scans staged Git files
- Returns a non-zero exit code when a match is found
- Suitable for local hooks and CI

## Usage

`powershell
python sentinel.py
`",
",


This is a lightweight pattern-based guardrail. It does not replace GitHub Secret Scanning, push protection, or dedicated secret management.

## Project goal

Shift security left by detecting common accidental secret exposure before code is committed.
