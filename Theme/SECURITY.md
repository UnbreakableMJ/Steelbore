# 🛡️ Security Policy

Security is an uncompromising priority of the **Steelbore Standard**. We build software under the assumption of a hostile environment. Our architecture mandates memory-safe languages (primarily Rust), aggressive compiler-level hardening (ASLR, CFI), and strict privacy boundaries.

If you believe you have found a vulnerability that compromises these principles, we want to know immediately.

## 🛡️ Supported Versions

We currently provide security updates for the following versions:

| Version | Supported |
| :--- | :--- |
| **1.x.x** | ✅ |
| **< 1.0** | ❌ |

> **Note**: As an active rolling project, we highly encourage all users to compile or run the latest available commits from the `main` branch.

## 🎯 Scope of Vulnerabilities

We consider the following to be critical security vulnerabilities within the context of the Steelbore Standard:

- **Memory Safety Violations**: Buffer overflows, use-after-free, or memory leaks (especially in any `unsafe` Rust blocks or alternative languages like Zig/C).
- **Mitigation Bypasses**: Any method that reliably bypasses Address Space Layout Randomization (ASLR), Control-Flow Integrity (CFI), or stack-smashing protections.
- **Privacy Violations (PFA)**: Any unintended network calls, telemetry, local storage exposure, or data exfiltration. Steelbore is strictly offline unless explicitly configured by the user.
- **Cryptographic Failures**: Weak algorithms, improper key storage, or insecure random number generation.
- **Privilege Escalation**: Any script or application component that allows a user to execute code outside of their intended permission scope.

### Out of Scope
- Visual glitches or color contrast issues (though these should be reported as standard bugs for WCAG compliance).
- Bugs that require physical access to the user's unlocked machine.
- Denial of Service (DoS) attacks requiring unrealistic amounts of local resources.

## 🚨 Reporting a Vulnerability

**Please do not report security vulnerabilities through public GitHub issues.** Instead, please report them via a secure channel. You can reach the core maintainer(s) via the following methods:

- **GitHub Private Vulnerability Reporting**: Go to the "Security" tab of this repository and click "Report a vulnerability".
- **Email**: Send a detailed report to `[Insert Security Email Address Here]`.
- **Optional but encouraged**: Encrypt your email using our public PGP key: `[Insert PGP Key Link or Fingerprint]`.

### What to Include in Your Report
To help us resolve the issue as rapidly as possible, please include:
1. A detailed description of the vulnerability and its potential impact.
2. Exact steps to reproduce the issue (a proof-of-concept script or video is highly appreciated).
3. The OS, environment, and version of Steelbore you are testing against.
4. Any potential mitigations you suggest.

## ⏱️ Response and Disclosure Timeline

1. **Acknowledgment**: We will acknowledge receipt of your vulnerability report within **48 hours**.
2. **Triage**: We will confirm the vulnerability and provide a severity assessment within **5 days**.
3. **Patch**: We aim to deploy a hardened patch and issue a security advisory within **14 to 30 days**, depending on complexity.
4. **Coordinated Disclosure**: Once the patch is merged and users are notified to update, we will publicly acknowledge your contribution (if desired) and publish the details of the vulnerability.

We ask that you practice coordinated disclosure and refrain from publishing details of the vulnerability until a patch has been made available to the community.