# 11.6 广义线性模型

广义线性建模是线性建模的一种发展，它通过一种简洁而又直接的方式使得线性 模型既适合非正态分布的响应值又可以进行线性变换[^1]。广义线性模型是基于下面一 系列假设前提的:

* 有一个有意思的响应变量y和一系列刺激变量(stimulus variable)x1, x2, ...。 这些刺激变量决定响应变量的最终分布。

* 刺激变量仅仅通过一个线性函数影响响应值y 的分布。该线性函数称为线性预测器(linear predictor)，常常写成

  $\eta = \beta_1 x_1 + \beta_2 x_2 + … + \beta_p x_p$，

  因此 $x_i$ 当且仅当 $\beta_i = 0$ 时对 $y$ 的分布没有影响。

* $y$ 分布的形式为

  $f_Y(y; \mu, \phi)
    = exp((\frac{A}{\phi}) * (y \lambda(\mu) - \gamma(\lambda(\mu))) + \tau(y, \phi))$

  其中 $\phi$ 是*尺度参数(scale parameter)*(可能已知)，对所有观测恒定，$A$ 是一个先验的权重，假定知道但可能随观测不同有所不同，$\mu$ 是 $y$ 的均值。也就是说假定 $y$ 的分布是由均值和一个可能的尺度参数决定的。

* 均值 $\mu$ 是线性预测器的平滑可逆函数(smooth invertible function)：

  $\mu = m(\eta),    \eta = m^{-1}(\mu) = \ell(\mu)$

  其中的反函数(inverse function) $\ell()$ ，被称为*关联函数(link function)*

这些假定比较宽松，足以包括统计实践中大多数有用的统计模型，同时也足够严谨，使得可以发展参数估计和统计推论(estimation and inference)中一致的方法(至少可以近似一致)。读者如果想了解这方面最新的进展，可以参考McCullagh & Nelder (1989) 或者Dobson (1990)。







---

[^1]: 译者注：原为为:“Generalized linear modeling is a development of linear models to accommodate both non-normal response distributions and transformations to linearity in a clean and straightforward way.”