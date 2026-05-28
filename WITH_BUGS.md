# WITH_BUGS.md — Verified Bugs in With v0.14.3

> This file tracks verified bugs and improvement candidates discovered while working with With v0.14.3.
> These are **With-language issues**. The goal is to stay compatible with upstream and offer changes via the contributing guidelines at:     
> https://github.com/Grumpified-OGGVCT/with-windows/blob/main/CONTRIBUTING.md
> 
> **Rules we follow:** No workarounds. Fix the actual upstream code. No placeholders. No silent fallbacks.

---

## Issue 1: `sqrt_f32` missing from `lib/std/math.w`

**Category:** Standard library / Missing function
**Severity:** Low
**Upstream Relevance:** Yes
**Status:** Fix ready, needs PR

### Summary
`f32` does not have a square-root wrapper in `lib/std/math.w`. Only `f64` has `sqrt_f64()`. Users must either:
- Cast `f32` to `f64`, call `sqrt_f64()`, cast back (two conversions, loss of precision)
- Or write their own `extern fn sqrtf(x: f32) -> f32`

### Repro
```with
use std.math

fn demo(x: f32) -> f32:
    sqrt_f32(x)  // error: unknown function 'sqrt_f32'
```

### Expected Behavior
`sqrt_f32(x: f32) -> f32` exists alongside `sqrt_f64`.

### Actual Behavior
Function does not exist.

### Fix
Add to `lib/std/math.w`:
```with
extern fn sqrtf(x: f32) -> f32
/// Square root for f32.
pub fn sqrt_f32(x: f32) -> f32:
    sqrtf(x)
```

This is a **library-only** change — no compiler change, no fixpoint verification required. Just run the test suite.

---

## Issue 2: Array-valued types (`[f32; size]`) cannot use `const` or generic parameters

**Category:** Type system / Generics
**Severity:** Medium (affects portability of code with variable dimensions)
**Upstream Relevance:** Yes
**Status:** Needs upstream decision (compiler change)

### Summary
Array type syntax `[T; N]` rejects both:
1. `const` values as `N`
2. Generic `usize` parameters as `N`

Neither of these compiles:
```with
const MAX: usize = 256
type Foo { data: [f64; MAX] }     // error: expected int literal
type Bar[N: usize] { data: [f64; N] }  // error: N not valid here
```

The standard library workarounds this by using pointer-based types (`Vec[T]`, `HashMap[K,V]`), but native stacks can't.

### Repro
```with
const S: usize = 4
type Buf { data: [f64; S] }
fn main: print("never reaches here")
```

### Expected Behavior
Either `const` values or generic parameters are accepted as array sizes.

### Actual Behavior
Both are rejected with `error: expected array size after ';'`.

### Fix
Compiler change. The parser resolves array sizes immediately; it needs to defer resolution to a pass that knows `const` and generic bindings. This touches `src/Parser.w` and `src/Sema.w`. Requires fixpoint verification.

---

## Issue 3: `c_import` block syntax rejected by parser

**Category:** Parser
**Severity:** Medium (spec vs. implementation gap)
**Upstream Relevance:** Yes
**Status:** Needs investigation of spec claim

### Summary
The spec (`docs/with-specification.md`) describes a block form:
```with
c_import "stdio.h" {
    fn printf(fmt: *str, ...) -> i32
}
```
But the parser rejects this with `error: expected expression`.

The only form that compiles is `use c_import("...")`, which is actually a different feature (C header inclusion for `#define` constants).

### Repro
```with
c_import "stdio.h" {
    fn printf(fmt: *str, ...) -> i32
}
fn main: print("test")
```

### Expected Behavior
Either:
- Block syntax is parsed and lowered to `extern fn` declarations, OR
- Spec documents that block syntax is not implemented

### Actual Behavior
Parser rejects block syntax. Error message is unhelpful (`expected expression`).

### Fix
Option A: Add parser support — new AST node `NK_C_IMPORT`, parser rule for `{ extern_fn* }`, lower to `extern fn` declarations in Resolve phase.
Option B: Update spec to document actual syntax (`extern fn` standalone + `use c_import("...")` for constants).

Both are valid upstream contributions. Option A is a compiler change (needs fixpoint). Option B is a documentation change.

---

## Resolved (False Positives)

### ~~Issue N: Install script downloads to ~/Downloads/~~
**REJECTED.** The upstream `scripts/install.sh` already uses `mktemp -d "${TMPDIR:-/tmp}/with-install.XXXXXX"`. The observation was from the `with build :seed` command in a different tool, not the install script.

### ~~Issue N: Install script doesn't add PATH automatically~~
**REJECTED.** Same as above — the install script is correct. It prints a helpful note. Adding to `.bashrc` automatically is invasive and not standard practice.

---

## Tracking: Fixes in Progress

| Issue | File | Status |
|-------|------|--------|
| sqrt_f32 | `lib/std/math.w` | 🔄 Fix ready |
| Array generics | `src/Parser.w`, `src/Sema.w` | ⏳ Needs compiler rebuild |
| c_import block | `src/Parser.w` or `docs/` | ⏳ Needs spec read |

