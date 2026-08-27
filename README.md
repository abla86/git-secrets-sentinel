# Git Secrets Sentinel

A lightweight local Git pre-commit security scanner designed to catch common accidental secret leaks before they reach a repository.

## What it does

Git Secrets Sentinel scans **staged Git files** and returns exit code `1` when a configured secret pattern is detected. That makes it usable as both a developer-side pre-commit guardrail and a CI check.

### Detects

- AWS access-key patterns
- Private-key headers
- Hardcoded password assignments
- Azure secret/token assignments
- Generic API key/token assignments

## Quick start

From this repository:

```powershell
python sentinel.py
```

To install the scanner into another local Git repository:

```powershell
powershell -ExecutionPolicy Bypass -File .\install-hook.ps1
```

The installer creates a versioned Git pre-commit hook that calls the Sentinel scanner.

## Example

```text
SECURITY ERROR: config.txt: AWS access key

COMMIT BLOCKED: remove or externalize detected secrets before committing.
```

## Security model

This project is intentionally small. It is a **pattern-based shift-left control**, not a complete secret-management platform.

Use it together with:

1. GitHub Secret Scanning / push protection
2. CI security scanning
3. Credential rotation
4. Least-privilege access
5. Managed identities / workload identity where available
6. Dedicated secret-management systems

## Limitations

Regex-based detection can produce false positives and false negatives. Obfuscated, encoded or provider-specific credentials may require additional detectors.

The tool does not transmit scanned content anywhere.

## License

MIT
