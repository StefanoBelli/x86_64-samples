# x86/examples/stack_arrays/2dim
Two dimensions arrays manipulation using x86 assembly

### Don't panic
I would like to make this as easier as possible, it is not so hard as it sounds.

### An array
An array is just a bunch of data put one after another in memory, right?
If this is right, then, you're ready because with matrices it is **the same**:

rows and cols are put one after another in memory, our CPU doesn't care about them, the compiler does the magic.

### Row-major ordering and visualize a 2D array
If you never heard about row-major ordering, it is a type of ordering for multi-dimensional arrays in memory, in which
we put rows one after another. This type of ordering is the most commonly used, and, surprise, even in C and C++.

(Languages like fortran use column-major ordering)

so we have our matrix in mind:

```
		 col0 col1
  row0 [ 10 | 11 ]  = M
  row1 [ 12 | 13 ]  
```

This matrix is placed on the stack as following:

```
Stack space
--------------------------------------------
         Our Matrix
         ------------------------
           row0     ++  row1
         -----------++-----------
[...]    [ 10 ][ 11 ][ 12 ][ 13 ]      [...]
```

Ok, great, an array, in practice, we have.

Now what? **How do I refer to a specific row,col coordinate?**

A simple mathematical expression allows us to do this:

```
m(r,c) = (r * K) + c

r times K plus c
```

where:
 * r is the row
 * c is the column
 * K is a costant: the number of columns for this matrix
 
Obviously, we are assembly programmers, (or assumed to be), so, we have to multiply the overall result of the mathematical
expression by the size of the data in matrix.

In this example we are using 8 Byte data, so, we can shift bits to the left by 3 to get a multiplication by 8:
