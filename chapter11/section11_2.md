# 11.2 线性模型

 对于常规的多重模型(multiple model)拟合，最基本的函数是 `lm()`。下面是调用它的方式的一种改进版：

```R
> fitted.model <- lm(formula, data = data.frame) 
```

例如

```R
> fm2 <- lm(y ~ x1 + x2, data = production)
```

将会拟合 `y` 对 `x1` 和 `x2` 的多重回归模型(和一个隐式的截距项)。 一个重要的(技术上可选)参数是 `data = production`。它指定任何构建这个模型的变量首先必须来自数据框 `production`。这里不需要考虑数据框 `production` 是否被绑定在搜索路径中。

