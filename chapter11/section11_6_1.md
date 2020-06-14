# 11.6.1 族

R 提供了一系列广义线性建模工具，从类型上来说包括*高斯(gaussian)，二项分布，泊松(poisson)，逆高斯(inverse gaussian)和伽马(gamma)*模型的响应变量分布以及响应变量分布无须明确给定的*拟似然(quasi-likelihood)*模型。在后者，*方差函数 (variance function)*可以由均值的函数指定，但在其它情况下，该函数可以由响应变量的分布得到。

每一种响应分布允许各种关联函数将均值和线性预测器关联起来。这些自动可用的关联函数如下表所示：

| Family name        | 关联函数                                                     |
| ------------------ | ------------------------------------------------------------ |
| `binomial`         | `logit`, `probit`, `log`, `cloglog`                          |
| `gaussian`         | `identity`, `log`, `inverse`                                 |
| `Gamma`            | `identity`, `inverse`, `log`                                 |
| `inverse.gaussian` | `1/mu^2`, `identity`, `inverse`, `log`                       |
| `poisson`          | `identity`, `log`, `sqrt`                                    |
| `quasi`            | `logit`, `probit`, `cloglog`, `identity`, `inverse`, `log`, `1/mu^2`, `sqrt` |

这些用于模型构建过程中的响应分布，关联函数和各种其他必要的信息统称为广义线性模型的*族(family)*。