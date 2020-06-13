# 10.6.3 递归式的数值积分

函数可以是递归的，可以在函数内部调用自己。但是需要注意的是，这些函数或者变量，不会被更高层次解析框架(evaluation frame)中的函数所继承，除非它们在搜索路径中[^1]。

下面的例子显示了一个最朴素的一维数值积分方法。被积函数在所积范围的两端和中点的值会被计算。如果单面板梯形法则(one-panel trapezium rule)的结果和双面板(two panel) 的非常相似，那么就以后者结果作为返回值。否则同样的过程会递归用于各个面板。这是一个自适应的积分过程。它会集中各个远离线性曲线区域的被积函数计算值[^2]。但是这种方法开销有点过大，相对其他积分算法，它的优势仅体现在被积函数既平滑又很难求值时。

这个例子同样可以部分的作为一个 R 编程的难题给出。

```R
area <- function(f, a, b, eps = 1.0e-06, lim = 10) {
  fun1 <- function(f, a, b, fa, fb, a0, eps, lim, fun) {
    ## 函数 ‘fun1’ 仅仅在 ‘area’ 内可见
    d <- (a + b)/2
    h <- (b - a)/4
    fd <- f(d)
    a1 <- h * (fa + fd)
    a2 <- h * (fd + fb)
    if(abs(a0 - a1 - a2) < eps || lim == 0)
      return(a1 + a2)
    else {
      return(fun(f, a, d, fa, fd, a1, eps, lim - 1, fun) +
             fun(f, d, b, fd, fb, a2, eps, lim - 1, fun))
    }
  }
  fa <- f(a)
  fb <- f(b)
  a0 <- ((fa + fb) * (b - a))/2
  fun1(f, a, b, fa, fb, a0, eps, lim, fun1)
}
```







---

[^1]: 译者注：原文为“that such functions, or indeed variables, are not inherited by called functions in higher evaluation frames as they would be if they were on the search path.”
[^2]: 译者注：原句为:“The result is an adaptive integration process that concentrates funtion evalu- tions in regions where the integrand is farthest from linear.”

