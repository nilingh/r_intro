# 10.6.2 去除打印数组中的名字

为了显示一个大的数组或者矩阵，常常需要需要以一个完整的块的形式显示，同时去掉数组名或编号。简单地去掉 `dimnames` 属性是不能达到这个要求的，因为 R 环境会把空字符串赋给 `dimnames` 属性。例如打印一个矩阵X

```R
> temp <- X
> dimnames(temp) <- list(rep("", nrow(X)), rep("", ncol(X))) 
> temp; rm(temp)
```

这个可以非常容易地通过下面的函数 `no.dimnames()` 实现。它是利用一种“卷绕”(wrap around)的方式实现的。这个例子还说明一些非常高效有用的用户函数可以是非常简洁的。

```R
no.dimnames <- function(a) {
	## 为了更紧凑的打印输出，可以去除数组中的维度名字 
  d <- list()
  l <- 0
  for(i in dim(a)) {
    d[[l <- l + 1]] <- rep("", i)
  }
  dimnames(a) <- d
  a
}
```

通过这个函数，数组可以用一种紧凑的方式显示

```R
> no.dimnames(X)
```

这对大的整数数组非常有用，尤其当关注点是数组表现出来的模式(pattern)而非它们的数值。 