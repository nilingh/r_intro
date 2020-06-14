# 11.3 提取模型信息的泛型函数

`lm()` 的返回值是一个模型拟合结果对象；技术上就是属于类"`lm`"的一个结果列表。关于拟合模型的信息可以用适合对象类"`lm`"的泛型函数显示，提取，图示等等。 这包括

```R
add1    deviance   formula      predict  step
alias   drop1      kappa        print    summary
anova   effects    labels       proj     vcov
coef    family     plot         residuals
```

其中一些常用的泛型函数可以简洁描述如下。

`anova(object_1, object_2)`	比较一个子模型和外部模型，并且产生方差分析表。

`coef(object)`	提取回归系数(矩阵)。 全称：`coefficients(object )`。

`deviance(object)`	残差平方和，若有权重可加权。

`formula(object)`	提取模型公式信息。

`plot(object)`	产生四个图，显式残差，拟合值和一些诊断图[^1]。

`predict(object, newdata=data.frame)`	提供的数据框必须有同原始变量一样标签的变量。结果是对应于 `data.frame` 中决定变量预测值的向量或矩阵。

`print(object)`	简要打印一个对象的内容。常常隐式使用[^2]。

`residuals(object)`	提取残差(矩阵)，有权重时可加权。省略方式： `resid(object)`。

`step(object)`	通过增加或者减少模型中的项并且保留层次来选择合适的模型。 在逐步搜索过程中，AIC (Akaike信息规范)值[^3][^4]最小的模型将会被返回。

`summary(object)`	显示较详细的模型拟合结果。

`vcov(object)`	返回被拟合模型对象主要参数的方差-协方差矩阵。





---

[^1]: 译者注：主要用于评估模型拟合情况的残差图。
[^2]: 译者注：一般不用print()，直接键入对象名也可以用来显示。
[^3]: 译者注：Benjamin Zhao网友觉得这里原文有误，step 返回的应该是 AIC 值最小的模型 ， 他/她给出的例子为：> data(swiss); >fit <- lm(Fertility~., data=swiss) ; fit.step <- step(fit, trace=F) ; >AIC(fit) ; [1] 326.0716 >AIC(fit.step) ; [1] 325.2408 ，其中 fit.step 返回模型的 AIC 值明显不是最大值。
[^4]: 在线英文原版目前已经更新了该问题