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
 Integers, Software: Practice and Experience 46 (6), 2016.
 http://arxiv.org/abs/1401.6399

There are other relevant references. For example, this code was used in Crane et al. (2017):

Matt Crane, J.Shane Culpepper, Jimmy Lin, Joel Mackenzie and Andrew Trotman, A Comparison of Document-at-a-Time and Score-at-a-Time Query Evaluation, Proceedings of the Tenth ACM International Conference on Web Search and Data Mining (WSDM 2017), 2017.


Other libraries
----------------

* SIMDCompressionAndIntersection: A C++ library to compress and intersect sorted lists of integers using SIMD instructions https://github.com/lemire/SIMDCompressionAndIntersection
* The FastPFOR C++ library : Fast integer compression https://github.com/lemire/FastPFor
* High-performance dictionary coding https://github.com/lemire/dictionary
* LittleIntPacker: C library to pack and unpack short arrays of integers as fast as possible https://github.com/lemire/LittleIntPacker
* The SIMDComp library: A simple C library for compressing lists of integers using binary packing https://github.com/lemire/simdcomp
* StreamVByte: Fast integer compression in C using the StreamVByte codec https://github.com/lemire/streamvbyte
* MaskedVByte: Fast decoder for VByte-compressed integers https://github.com/lemire/MaskedVByte
* CSharpFastPFOR: A C#  integer compression library  https://github.com/Genbox/CSharpFastPFOR
* JavaFastPFOR: A java integer compression library https://github.com/lemire/JavaFastPFOR
* Encoding: Integer Compression Libraries for Go https://github.com/zhenjl/encoding
* FrameOfReference is a C++ library dedicated to frame-of-reference (FOR) compression: https://github.com/lemire/FrameOfReference
* libvbyte: A fast implementation for varbyte 32bit/64bit integer compression https://github.com/cruppstahl/libvbyte
* TurboPFor is a C library that offers lots of interesting optimizations. Well worth checking! (GPL license) https://github.com/powturbo/TurboPFor
* Oroch is a C++ library that offers a usable API (MIT license) https://github.com/ademakov/Oroch


