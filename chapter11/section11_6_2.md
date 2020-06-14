# 11.6.2 glm()函数

既然响应的分布仅仅通过单一的一个线性函数依赖于刺激变量，那么用于线性模型的机制同样可以用于指定一个广义模型的线性部分。但是族必须以一种不同的方式指定。

R 用于广义线性回归的函数是 `glm()`，它的使用形式为

```R
> fitted.model <- glm(formula, family=family.generator, data=data.frame)
```

和 `lm()` 相比，唯一的一个新特性就是描述族的参数 `family.generator`。它其实是一个函数的名字，这个函数将产生一个函数和表达式列表用于定义和控制模型的构建与估计过程[^1]。尽管这些内容开始看起来有点复杂，但它们非常容易使用。

这些名字是标准的。程序给定的族生成器可以参见族部分表格中的“族名”。当选择一个关联函数时，该关联函数名和族名可以同时在括弧里面作为参 数设定。在拟(quasi)家族里面，方差函数也是以这种方式设定。

一些例子可能会使这个过程更清楚。

###### Gaussian族

命令

```R
> fm <- glm(y ~ x1 + x2, family = gaussian, data = sales)
```

和下面的命令结果一致

```R
> fm <- lm(y ~ x1+x2, data=sales)
```

但是效率上，前者差一点。注意，高斯族没有自动提供关联函数设定的选项，因此不允许设置参数。如一个问题需要用非标准关联函数的高斯族，那么只能采用我们后面讨论的拟族。

###### 二项式族

考虑Silvey (1970) 提供的一个人造的小例子。

在Kalythos的Aegean岛上，男性居民常常患有一种先天的眼科疾病，并且随着年龄的增长而变的愈明显。现在搜集了各种年龄段岛上男性居民的样本，同时记录了盲眼的数目。数据展示如下：

| Age:        | 20   | 35   | 45   | 55   | 70   |
| ----------- | ---- | ---- | ---- | ---- | ---- |
| No. tested: | 50   | 50   | 50   | 50   | 50   |
| No. blind:  | 6    | 17   | 26   | 37   | 44   |

我们想知道的是这些数据是否吻合logistic和probit模型，并且分别估计各个模型的LD50，也就是一个男性居民盲眼的概率为50%时候的年龄。

如果 $y$ 和 $n$ 分别是年龄为 $x$ 时的盲眼数目和检测样本数目，两种模型的形式都为 $y \sim B(n, F (\beta_0 + \beta_1x))$。其中在probit模型中，$F(z) = \Phi(z)$ 是标准的正态分布函数，而在logit模型(默认)中，$F(z) = \frac{e^z}{(1 + ez^)}$。这两种模型中，$LD50 = −\frac{\beta_0}{\beta_1}$，即分布函数的参数为0时所在的点。

第一步是把数据转换成数据框，

```R
> kalythos <- data.frame(x = c(20,35,45,55,70), n = rep(50,5),
                         y = c(6,17,26,37,44))
```

在 `glm()` 拟合二项式模型时，响应变量有三种可能性：

- 如果响应变量是向量，则假定操作*二元(binary)数据*，因此要求是*0/1*向量。
- 如果响应变量是*双列矩阵*，则假定第一列为试验成功的次数第二列为试验失败的次数。
- 如果响应变量是*因子*，则第一水平作为失败(0)考虑而其他的作为‘成功’(1)考虑。

这里，我们采用的是第二种惯例。我们在数据框中增加了一个矩阵：

```R
> kalythos$Ymat <- cbind(kalythos$y, kalythos$n - kalythos$y)
```

  为了拟合这些模型，我们采用

```R
> fmp <- glm(Ymat ~ x, family = binomial(link=probit), data = kalythos) 
> fml <- glm(Ymat ~ x, family = binomial, data = kalythos)
```

既然logit的关联函数是默认的，因此我们可以在第二条命令中省略该参数。为了查看拟合结果，我们使用

```R
> summary(fmp)
> summary(fml)
```

两种模型都拟合的很好。为了计算LD50，我们可以利用一个简单的函数：

```R
> ld50 <- function(b) -b[1]/b[2]
> ldp <- ld50(coef(fmp)); ldl <- ld50(coef(fml)); c(ldp, ldl)
```

从这些数据中得到的年龄分别是43.663年和43.601年。

###### Poisson模型

Poisson族默认的关联函数是 `log`。在实际操作中，这一族常常用于拟合计数资料的Poisson对数线性模型。这些计数资料的实际分布往往符合二项式分布。这是一个非常重要而又庞大的话题，我们不想在这里深入展开。它甚至是非-高斯广义模型内容的主要部分。

有时候，实践中产生的Poisson 数据在对数或者平方根转化后可当作正态数据处理。作为后者的另一种选择是，一个Poisson广义线性模型可以通过下面的方式拟合：

```R
> fmod <- glm(y ~ A + B + x, family = poisson(link=sqrt),
              data = worm.counts)
```

###### 拟似然模型

对于所有的族，响应变量的方差依赖于均值并且拥有作为乘数(multiplier) 的尺度参数。方差对均值的依赖方式是响应分布的一个特性；例如对于poisson分布 $Var[y] = \mu$。

对于拟似然估计和推断，我们不是设定精确的响应分布而是设定关联函数和方差函数的形式，因为关联函数和方差函数都依赖于均值。既然拟似然估计和gaussian分布使用的技术非常相似，因此这一族顺带提供了一种用非标准关联函数或者方差函数拟合gaussian模型的方法。

例如，考虑非线性回归的拟合

$y = \frac{\theta_1 z_1} {(z_2 - \theta_2)} + e$

同样还可以写成

$y = \frac{1} {(\beta_1 x_1 + \beta_2 x_2) }+ e$，其中 $x_1 = \frac{z_2}{z_1}, x_2 = \frac{-1}{z_1}, \beta_1 = \frac{1}{\theta_1}, and\ \beta_2 = \frac{\theta_2}{\theta_1}$。假如有适合的数据框，我们可以如下进行非线性拟合

```R
> nlfit <- glm(y ~ x1 + x2 - 1,
               family = quasi(link=inverse, variance=constant),
               data = biochem)
```

如果需要的话，读者可以从其他手册或者帮助文档中得到更多的信息。





---

[^1]: 译者注：原文为: “The only new feature is the family.generator, which is the instrument by which the family is described. It is the name of a function that generates a list of functions and expressions that together define and control the model and estimation process.”