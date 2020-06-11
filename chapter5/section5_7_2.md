# 5.7.2 线性方程和求逆

求解线性方程组是矩阵乘法的逆运算。当下面的命令运行后，

```R
> b <- A %*% x
```

如果仅仅给出 `A` 和 `b`，那么 `x` 就是该线性方程组的根。在 R 里面，用命令

```R
> solve(A,b)
```

求解线性方程组，并且返回 `x` (可能会有一些精度丢失)。注意，在线性代数里面该值表示为 `x = A^{−1} %*% b​` ，其中 `A^{−1}` 表示 `A` 的逆(inverse)。矩阵的逆可以用下面的命令计算，

```R
solve(A)
```

不过一般很少用到。在数学上，用直接求逆的办法解 `x <- solve(A) %*% b` 相比 `solve(A,b)` 不仅低效而且还有一种潜在的不稳定性。

用于多元计算的二次型 `x %*% A^{-1} %*% x` 可以通过[^1]像 `x %*% solve(A,x)` 的方式计算得到， 而不是直接计算 `A` 的逆。





---

[^1]:最好的方式当然是用A = BB′求解矩阵平方根B和利用A的Cholesky或特征值分解的办法得到By = x的解的自乘长度(squared length)。译者注:这里我还没有完全弄明白，可以参见原文注 解“Even better would be to form a matrix square root B with A = BB′ and find the squared length of the solution of By = x, perhaps using the Cholesky or eigendecomposition of A.”。