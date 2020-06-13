# 8.1 R 的统计表

R 给出了详尽的统计表。R 还提供了相关工具来计算累计概率分布函数 P (X ≤ x)，概率密度函数和分位数函数(给定q，符合P (X ≤ x) > q 的最小x就是对应的分位数)，和基于概率分布的计算机模拟。

| 概率分布     | R对应的名字 | 附加参数            |
| ------------ | ----------- | ------------------- |
| β分布        | beta        | shape1, shape2, ncp |
| 二项式分布   | binom       | size, prob          |
| Cauchy分布   | cauchy      | location, scale     |
| 卡方分布     | chisq       | df, ncp             |
| 指数分布     | exp         | rate                |
| F分布        | f           | df1, df1, ncp       |
| γ分布        | gamma       | shape, scale        |
| 几何分布     | geom        | prob                |
| 超几何分布   | hyper       | m,n,k               |
| 对数正态分布 | lnorm       | meanlog, sdlog      |
| logistic分布 | logis       | location, scale     |
| 负二项式分布 | nbinom      | size, prob          |
| 正态分布     | norm        | mean, sd            |
| Poisson分布  | pois        | lambda              |
| t分布        | t           | df, ncp             |
| 均匀分布     | unif        | min, max            |
| Weibull分布  | weibull     | shape, scale        |
| Wilcoxon分布 | wilcox      | m, n                |

不同的名字前缀表示不同的含义，d 表示概率密度函数，p 表示累积分布函数 (cumulative distribution function，CDF)，q 表示分位函数以及 `r` 表示随机模拟(random deviates)或者随机数发生器。`dxxx` 的第一个参数是 `x`，`pxxx` 是 `q`，`qxxx` 是 `p`，和`rxxx` 的是 `n` (`rhyper` 和 `rwilcox` 例外，二者的参数是 `nn`)。偏态指数(non- centrality parameter) `ncp` 现在仅用于累积分布函数，大多数概率密度函数和部分其他情况[^1]：更细节的内容可以参考在线帮助文档。

`pxxx` 和 `qxxx` 函数都有逻辑参数 `lower.tail` 和 `log.p`，` dxxx` 也有一个逻辑参数 `log`。这样就让计算函数的各种累积概率值成为可能。例如可以通过下式直接计算累计(“积分的”)风险(hazard)函数，H(t) = −log(1 − F(t))，

```R
- pxxx(t, ..., lower.tail = FALSE, log.p = TRUE)
```

或用来计算更精确的对数似然值(`dxxx(..., log = TRUE)`)。

此外还有函数 `ptukey` 和 `qtukey` 计算来自正态分布样本的标准化全距(studentized range)的分布，以及处理多项分布(multinomial distribution)的  `dmultinom` 和 `rmultinom` 。贡献包(contributed packages)中包含更多分布，尤其是[SuppDists](https://cran.r-project.org/web/packages/SuppDists/index.html)

这里是一些例子

```R
> ## t分布的双侧p值
> 2*pt(-2.43, df = 13)
> ## F(2, 7)分布的上1%分位数 
> qf(0.99, 2, 7, lower.tail = FALSE)
```

可参见 `RNG` 在线帮助在 R 中如何生成随机数。





---

[^1]: 译者注:原文为“In not quite all cases is the non-centrality parameter ncp are currently available...”