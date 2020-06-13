# 10.6.1 区组设计中的效率因子

下面是一个有点枯燥但较为完整的例子。它是用来计算一个区组设计(block design)中的效率因子(这个问题的一些方面在[索引矩阵](chapter5/section5_3.md)中已经讨论过了)。

区组设计(block design)需要考虑两个因子 `blocks (b 个水平) ` 和`varieties (v 个水平)`。如果 *R* 和 *K* 分别是 $v×v$ 和 $b×b$ *重复(replications)*及*区组大小(block size)*矩阵而 *N* 则是 $b×v$ 的关联矩阵(incidence matrix)，那么效率因子就是这个矩阵的特征值，即 $E = I_v − R^{−1/2}N′K^{−1}NR^{−1/2} = I_v − A′A$, 其中 $A = K^{−1/2}NR^{−1/2}$。 写这个函数的一种方式就是

```R
> bdeff <- function(blocks, varieties) {
    blocks <- as.factor(blocks)             # minor safety move
    b <- length(levels(blocks))
    varieties <- as.factor(varieties)       # minor safety move
    v <- length(levels(varieties))
    K <- as.vector(table(blocks))           # 去掉 dim 属性
    R <- as.vector(table(varieties))        # 去掉 dim 属性
    N <- table(blocks, varieties)
    A <- 1/sqrt(K) * N * rep(1/sqrt(R), rep(b, v))
    sv <- svd(A)
    list(eff=1 - sv$d^2, blockcv=sv$u, varietycv=sv$v)
}
```

这种情况下，奇异值分解比求解特征值的数值计算效率高。

函数的结果是一个列表。它不仅以第一个分量的形式给出了效率因子，还给出了区组和规范对照信息(block and variety canonical contrasts)，因为有些时候这些会给出额外有用的定量信息。