# 8.2 检验一个数据集的分布

我们可以用很多方法分析一个单变量数据集的分布。最简单的办法就是直接看数字。利用函数 `summary` 和 `fivenum` 会得到两个稍稍有点差异的汇总信息。 此外，`stem` (一种“茎叶型的”图)也会反映整个数据集的数字信息。

```R
> attach(faithful)
> summary(eruptions)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  1.600   2.163   4.000   3.488   4.454   5.100 
> fivenum(eruptions)
[1] 1.6000 2.1585 4.0000 4.4585 5.1000 
> stem(eruptions)

     The decimal point is 1 digit(s) to the left of the |

  16 | 070355555588
  18 | 000022233333335577777777888822335777888
  20 | 00002223378800035778
  22 | 0002335578023578
  24 | 00228
  26 | 23
  28 | 080
  30 | 7
  32 | 2337
  34 | 250077
  36 | 0000823577
  38 | 2333335582225577
  40 | 0000003357788888002233555577778
  42 | 03335555778800233333555577778
  44 | 02222335557780000000023333357778888
  46 | 0000233357700000023578
  48 | 00000022335800333
  50 | 0370
```

茎叶图和柱状图相似，R 用函数 `hist`  绘制柱状图。

```R
> hist(eruptions)
> ## 让箱距缩小，绘制密度图
> hist(eruptions, seq(1.6, 5.2, 0.2), prob=TRUE)
> lines(density(eruptions, bw=0.1))
> rug(eruptions) # 显示实际的数据点
```

更为精致的密度图是用函数 `density` 绘制的。在这个例子中，我们加了一条由 `density` 产生的曲线。你可以用试错法(trial-and-error)选择带宽 `bw` (bandwidth) 因为默认的带宽值让密度曲线过于平滑(这样做常常会让你得到非常有“意思”的密度分布)。(现在已经有一些自动的带宽挑选方法[^1]，在这个例子中 `bw = "SJ"` 给出的结果不错。)

![images/hist](https://cran.r-project.org/doc/manuals/r-release/images/hist.png)

我们可以用函数 `ecdf` 绘制一个数据集的经验累积分布(empirical cumulative distribution)函数。

```R
> plot(ecdf(eruptions), do.points=FALSE, verticals=TRUE)
```

显然，这个分布和其他标准分布差异很大。那么右边的情况怎么样呢，就是火山爆发3分钟后的状况？我们可以拟合一个正态分布，并且重叠前面得到的经验累积密度分布。

```R
> long <- eruptions[eruptions > 3]
> plot(ecdf(long), do.points=FALSE, verticals=TRUE)
> x <- seq(3, 5.4, 0.01)
> lines(x, pnorm(x, mean=mean(long), sd=sqrt(var(long))), lty=3)
```

![images/ecdf](https://cran.r-project.org/doc/manuals/r-release/images/ecdf.png)

分位比较图(Quantile-quantile (Q-Q) plot)便于我们更细致地研究二者的吻合程度。

```R
par(pty="s") # 设置一个方形的图形区域 
qqnorm(long); qqline(long)
```

上述命令得到的Q-Q图表明二者还是比较吻合的，但右侧尾部偏离期望的正态分布。 我们可以用 *t* 分布获得一些模拟数据以重复上面的过程

![images/QQ](https://cran.r-project.org/doc/manuals/r-release/images/QQ.png)

```R
x <- rt(250, df = 5) 
qqnorm(x); qqline(x)
```

这里得到的Q-Q图常常会出现偏离正态期望的长尾区域(如果是随机样本)。我们可以用下面的命令针对特定的分布绘制Q-Q图

```R
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)
```

最后，我们可能需要一个比较正规的正态性检验方法。R 提供了 Shapiro-Wilk 检验

```R
> shapiro.test(long)
				Shapiro-Wilk normality test
data: long
W = 0.9793, p-value = 0.01052
```

和 Kolmogorov-Smirnov 检验

```R
> ks.test(long, "pnorm", mean = mean(long), sd = sqrt(var(long)))
				One-sample Kolmogorov-Smirnov test
data: long
D = 0.0661, p-value = 0.4284 
alternative hypothesis: two.sided
```

(注意一般的统计分布理论(distribution theory)在这里可能无效，因为我们用同样的样本对正态分布的参数进行估计的。)





---

[^1]: 译者注：带宽选择对密度曲线的形状影响很大。具体可以参见?density和?bw.nrd。