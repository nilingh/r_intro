# 11.1.1 对照

我们至少要知道模型公式是如何指定模型矩阵的列项的。对于连续变量这是比较简单的，因为每一个变量对应于模型矩阵的一个列(如果模型中包含截距，会在矩阵中列出值都是1的一列)。

对于一个*k-*水平的因子 `A` 该如何处理呢？无序和有序因子给出的结论是不一样的。对于无序因子，因子第2，. . . ，第*k*不同水平的指标产生*k − 1*列。(因此隐含的参数设置就是把其他水平和第一个水平的响应程度进行比较)。对于有序因子，*k − 1*列是在*1, . . . , k*上的正交项(orthogonal polynomial)，并且忽略常数项。

尽管这里的回答有点复杂，但这不是事情的全部。首先在含有一个因子项的模型中忽略截距项，这一项将会被编入指示所有因子水平的 *k* 列中[^1]。其次整个行为可以通过 `options` 设置参数 `contrasts` 而改变。R 的默认设置为

```R
options(contrasts = c("contr.treatment", "contr.poly"))
```

提这些内容的主要原因是R 和 S 对无序因子采用不同的默认值。 S采用Helmert对照。因此，当你需要比较你的结果和某本书上或论文上用S-PLUS 代码的结果时，你必须设置

```R
options(contrasts = c("contr.helmert", "contr.poly"))
```

这是一个经过认真考虑的改变。因为处理对照(treatment contrast)(R默认) 对于新手是比较容易理解的。

这还没有结束，因为在各个模型的各个项中对照方式可以用函数 `contrasts` 和 `C` 重新设置。

我们还没有考虑交互作用项:这些交互作用项将会产生各分量项的乘积[^2]。

尽管细节是复杂的，R 里面的模型公式在要求不是太离谱的情况下可以产生统计专家所期望的各种模型。提供模型公式的各种扩展特性是让 R 更灵活。例如，利用关联项而非主要效应的模型拟合常常会产生令人惊讶的结果，不过这些仅仅为统计专家们设计的。





---

[^1]: 译者注：原句为“First, if the intercept is omitted in a model that contains a factor term, the first such term is encoded into k columns giving the indicators for all the levels.”
[^2]: 译者注：原文为“ We have not yet considered interaction terms: these generate the products of the columns introduced for their component terms.”