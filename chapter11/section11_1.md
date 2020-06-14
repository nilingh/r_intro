# 11.1 定义统计模型的公式

下面统计模型的模板是一个基于独立的方差齐性数据的线性模型

$y_i = \sum_{j=0}^p \beta_j x_{ij} + e_i,     i = 1, …, n$

其中$e_i \sim NID(0,\sigma^2)$。用矩阵术语表示，它可以写成

$y = X  \beta + e$

其中 $y$ 是响应向量，$X$ 是模型矩阵(model matrix)或者设计矩阵(design matrix)。$X$ 的列 $x_0,x_1,...,x_p$ 是决定变量(determining variable)。通常，$x_0$ 列都是1，用来定义截距(intercept)项。

**例子**

在给予正式的定义前，举一些的例子可能更容易了解全貌。

假定 `y, x, x0, x1, x2, ...` 是数值变量，`X` 是一个矩阵，而 `A, B, C, ...`  是因子。下面的例子中，左边给出公式，右边给出该公式的统计模型的描述。

```R
y ~ x
y ~ 1 + x
# 二者都反映了 y 对 x 的简单线性模型。第一个公式包含了一个隐式的截距项，而第二个则是一个显式的截距项。
```

```R
y ~ 0 + x
y ~ -1 + x
y ~ x - 1
# y 对 x 过原点的简单线性模型(也就是说，没有截距项)。
```

```R
log(y) ~ x1 + x2
# y 的变换形式 log(y) 对 x1 和 x2 进行的多重回归(有一个隐式的截距项)。
```

```R
y ~ poly(x,2)
y ~ 1 + x + I(x^2)
# y 对 x 的二次多项式回归。第一种是正交多项式(orthogonal polynomial)，第二种则显式地注明各项的幂次。
```

```R
y ~ X + poly(x,2)
# y 利用模型矩阵X 和二次多项式项x 进行多重回归。
```

```R
y ~ A
# y 的单因素方差分析模型，类别由 A 决定。
```

```R
y ~ A + x
# y 的单因素协方差分析模型，类别由 A 决定，协方差项为 x。
```

```R
y ~ A*B
y ~ A + B + A:B
y ~ B %in% A
y ~ A/B
# y 对 A 和 B的非可加两因子方差分析模型(two factor non- additive model)。前两个公式表示相同的交叉分类设计 (crossed classification)，后两个公式表示相同的嵌套分类设计(nested classification)。抽象一点说，这四个公式指明同一个模型子空间。
```

```R
y ~ (A + B + C)^2
y ~ A*B*C - A:B:C
# 三因子实验。该模型包括一个主效应(main effects)和两个因子的交互效应(interactions)。这两个公式等价。
```

```R
y ~ A * x
y ~ A/x
y ~ A/(1 + x) - 1
# 在A的各个水平独立拟合y 对x 的简单线性回归。三个公式 的编码不一样。最后一个公式会对A 各个水平分别估计截 距项和斜率项的2。
```

```R
y ~ A*B + Error(C)
# 一个实验设计有两个处理因素 A 和 B 以及因子 C 决定的 误差分层(error strata)。如在裂区实验设计(split plot experiment)中，所有区组(还包括子区组)都由因子 C 决定的。
```

操作符 ~ 用来定义 R 的模型公式(model formula)。一个普通的线性模型公式 可以表示为

$response \sim op_1\ term_1\ op_2\ term_2\ op_3\ term_3\ …$

其中

$response$ 是一个作为响应变量的向量或者矩阵，或者是一个值为向量/矩阵的表达式。

$op_i$ 是一个操作符。它要么是 + 要么是 -，分别表示在一个模型中加入或者去掉某一 项(公式第一项的操作符可选[^1])。

$term_i$ 可以是

* 一个向量，矩阵表达式或者1，
* 一个因子，
* 一个由因子，向量或矩阵通过公式操作符连接产生的*公式表达式 (formula expression)*。

基本上，公式中的项决定了模型矩阵中的列要么被加入要么被去除。1 表示截距项，并且默认就已加入模型矩阵，除非显式地去除这一选项。

*公式操作符(formula operators)*在效果上和用于程序 Glim 和 Genstat 中的Wilkinson & Rogers 标记符(notation) 相似。一个不可避免的改变是操作符 `.` 在 R 里面变成了 `:`，因为点号在 R 里面是合法的命名字符。

这些符号总结如下(参考Chambers & Hastie, 1992, p.29)：

`Y ~ M`	Y 由模型 M 解释。

`M_1 + M_2`	同时包括 M_1 和 M_2 项。

`M_1 - M_2`	包括 M_1 但排除 M_2 项。

`M_1 : M_2`	M_1 和 M_2 的张量积(tensor product)。如果两项都是因子，那么将产生“子类”因子(subclasses factor)[^2]。

`M_1 * M_2`	等价于 `M_1 + M_2 + M_1:M_2`

`M_1 / M_2`	等价于 `M_1 + M_2 %in% M_1`

`M^n`	M 的所有各项以及所有到 n 阶为止的“交互作用”项[^3]

`I(M)`	隔离M 。M 内所有操作符当一般的运算符处理。并且该项出现在模型矩阵中。

注意，在常常用来封装函数参数的括弧中的操作符按普通的四则运算法则解 释。`I()` 是一个恒等函数(identity function)，它使得常规的算术运算符可以用在模型公式中。

还要特别注意模型公式仅仅指定了*模型矩阵的列项*，暗含了对参数项的指定。在某些情况下可能不是这样，如非线性模型的参数指定。

[11.1.1 对照](chapter11/section11_1_1.md)





---

[^1]: 译者注：即可以省略。
[^2]: 译者注：因子交互作用项。
[^3]: 译者注：原文为：“All terms in M together with “interactions” up to order n”