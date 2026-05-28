//! expect-stdout: ok

// Regression test for missing sqrt_f32 in std.math
// Verifies that sqrt_f32 returns correct results for common values.

use std.math

fn test_sqrt_f32_positive:
    // sqrt(4.0) = 2.0
    assert(sqrt_f32(4.0f32) == 2.0f32)
    // sqrt(9.0) = 3.0
    assert(sqrt_f32(9.0f32) == 3.0f32)
    // sqrt(1.0) = 1.0
    assert(sqrt_f32(1.0f32) == 1.0f32)

fn test_sqrt_f32_zero:
    // sqrt(0.0) = 0.0
    assert(sqrt_f32(0.0f32) == 0.0f32)

fn test_sqrt_f64_still_works:
    // Make sure we didn't break sqrt_f64
    assert(sqrt_f64(4.0f64) == 2.0f64)
    assert(sqrt_f64(9.0f64) == 3.0f64)

fn main:
    test_sqrt_f32_positive()
    test_sqrt_f32_zero()
    test_sqrt_f64_still_works()
    print("ok")
