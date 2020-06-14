# 11.7.1 最小二乘法

拟合非线性模型的一种办法就是使误差平方和(SSE)或残差平方和最小。如果观测到的误差极似正态分布，这种方法是非常有效的。

下面是例子来自Bates & Watts (1988)，51页。具体数据是：

```R
> x <- c(0.02, 0.02, 0.06, 0.06, 0.11, 0.11, 0.22, 0.22, 0.56, 0.56, 1.10, 1.10)
> y <- c(76, 47, 97, 107, 123, 139, 159, 152, 191, 201, 207, 200)
```

被拟合的模型是：

```R
> fn <- function(p) sum((y - (p[1] * x)/(p[2] + x))^2)
```

为了进行拟合，我们需要估计参数初始值。一种寻找合理初始值的办法把数据图形化，然后估计一些参数值，并且利用这些值初步添加模型曲线。

```R
> plot(x, y)
> xfit <- seq(.02, 1.1, .05)
> yfit <- 200 * xfit/(0.1 + xfit)
> lines(spline(xfit, yfit))
```

当然，我们可以做的更好，但是初始值200和0.1应该足够了。现在做拟合：

```R
> out <- nlm(fn, p = c(200, 0.1), hessian = TRUE)
```

拟合后，`out$minimum` 是误差的平方和(SSE)，`out$estimate` 是参数的最小二乘估计值。为了得到参数估计过程中近似的标准误(SE)，我们可以：

```R
> sqrt(diag(2*out$minimum/(length(y) - 2) * solve(out$hessian)))
```

上述命令中的2表示参数的个数。一个95%的信度区间可以通过 $\pm1.96 SE$ 计算得到。我们可以把这个最小二乘拟合曲线画在一个新的图上：

```R
> plot(x, y)
> xfit <- seq(.02, 1.1, .05)
> yfit <- 212.68384222 * xfit/(0.06412146 + xfit)
> lines(spline(xfit, yfit))
```

标准包 `stats` 提供了许多用最小二乘法拟合非线性模型的扩充工具。我们刚刚拟合过的模型是Michaelis-Menten模型，因此可以利用下面的命令得到类似的结论。

```R
> df <- data.frame(x=x, y=y)
> fit <- nls(y ~ SSmicmen(x, Vm, K), df)
> fit
Nonlinear regression model
  model:  y ~ SSmicmen(x, Vm, K)
   data:  df
          Vm            K
212.68370711   0.06412123
 residual sum-of-squares:  1195.449
> summary(fit)

Formula: y ~ SSmicmen(x, Vm, K)

Parameters:
    Estimate Std. Error t value Pr(>|t|)
Vm 2.127e+02  6.947e+00  30.615 3.24e-11
K  6.412e-02  8.281e-03   7.743 1.57e-05

Residual standard error: 10.93 on 10 degrees of freedom

Correlation of Parameter Estimates:
      Vm
K 0.7651
```



