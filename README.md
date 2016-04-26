# FastDifferentialCoding
[![Build Status](https://travis-ci.org/lemire/FastDifferentialCoding.png)](https://travis-ci.org/lemire/FastDifferentialCoding)

These functions compute fast successive differences, and recover the original
values from the fast successive differences (i.e., they compute a prefix sum)
using fast SIMD instructions.

They can be useful as part of compressed index.

 Rationale 
-----------

Array of sorted integers, such as 1, 50, 100, 110, 120... are more often compressible 
when we first compute the successive differences (49, 50, 10, 10,....). The downside
of this improved compressibility is the need to recover the original integers by
computing the prefix sum. 

Programmers are often tempted to computer a prefix sum in the straight-forward manner:

```C
for (size_t i=1;i<size;i++) {
  data[i] += data[i-1];
}
```

Unfortunately, this approach can be slow. Thus we prefer to use SIMD instructions available
on recent Intel processors (SSE, available since the Pentium 4).

This library provide such fast functions.

Usage
-------

```C
compute_deltas_inplace(datain, length, 0);// compute the deltas in-place
compute_prefix_sum_inplace(datain, length, 0);// under the delta computations (datain is back)
```
See example.c for a complete example.

 Reference 
-----------

 Daniel Lemire, Nathan Kurz, Leonid Boytsov, SIMD Compression and the Intersection of Sorted
 Integers, Software: Practice and Experience (to appear)
 http://arxiv.org/abs/1401.6399

