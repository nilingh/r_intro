# 11.4.1 方差分析表

方差表的分析实际上是为拟合模型序列(sequence)进行的[^1]。在模型序列的*特定地方*增加*特定的项*会使残差平方和降低。因此仅仅在正交实验中，模型中增加项的次序是没有影响的[^2]。

在多层实验设计(multistratum experiments)中，程序首先把响应值依次投射到各个误差层次上，并且用均值模型去拟合各个投射。细节内容可以参考Chambers & Hastie (1992)。

除了使用常规的方差分析表(ANOVA table)，你还可以直接用函数 `anova()` 来比较两个模型。这种方法更为灵活。

```R
> anova(fitted.model.1, fitted.model.2, ...)
```

结果将是一个方差分析表以显示依次加入的拟合模型的差异。需要比较的拟合模型常常是等级序列(hierarchical sequence)。这个和默认的设置实际上没有差别，只是使它更容易理解和控制。





---

[^1]: 译者注：原句为“ Note also that the analysis of variance table (or tables) are for a sequence of fitted models.”
[^2]: 译者注：原句为“Hence only for orthogonal experiments will the order of inclusion be inconsequen- tial.”