# 10.9 类，泛型函数和面向对象

一个对象的类决定了它会如何被一个*泛型*函数[^1]处理。相反，一个泛型函数由*参数自身类的种类*来决定完成特定工作或者事务的。如果参数缺乏任何类属性，或者在该问题中有一个不能被任何泛型函数处理的类，泛型函数会有一种*默认的处理方式*。

下面的一个例子使这个问题变得清晰。类机制为用户提供了为特定问题设计和编写泛型函数的便利。在众多泛型函数中，`plot()` 用于图形化显示对象，`summary()` 用于各种类型的概述分析，以及 `anova()` 用于比较统计模型。

能以特定方式处理类的泛型函数的数目非常庞大。例如，可以在非常时髦的类对象 "`data.frame`" 中使用的函数有

```R
[     [[<-    any    as.matrix
[<-   mean    plot   summary
```

可以用函数 `methods()` 得到当前对某个类对象可用的泛型函数列表：

```R
> methods(class="data.frame")
```

相反，一个泛型函数可以处理的类同样很多。例如，`plot()` 有默认的方法和变量处理对象类 "`data.frame`"，"`density`"，"`factor`"，等等。一个完整的列表同样可以通过函数 `methods()` 得到：

```R
> methods(plot)
```

许多泛形函数的函数主体部分非常的短，如

```R
> coef
function (object, ...) 
UseMethod("coef")
```

`UseMethod` 的出现暗示着这是一个泛形函数。为了查看那些方法可以使用，我们可以使用函数 `methods()`

```R
> methods(coef)
[1] coef.aov*         coef.Arima*       coef.default*     coef.listof*
[5] coef.nls*         coef.summary.nls*

   Non-visible functions are asterisked
```

这个例子中有六个方法，不过其中任何一个都不能简单地通过键入名字来查看[^2]。我 们可以通过下面两种方法查看

```R
> getAnywhere("coef.aov")
A single object matching ‘coef.aov’ was found
It was found in the following places
  registered S3 method for coef from namespace stats
  namespace:stats
with value

function (object, ...)
{
    z <- object$coef
    z[!is.na(z)]
}

> getS3method("coef", "aov")
function (object, ...)
{
    z <- object$coef
    z[!is.na(z)]
}
```

泛型 `gen` 对应 `cl` 类将调用一个名为 `gen.cl` 的函数，所以无需这样对对此类函数命名，除非打算将其当作方法(methods)

读者可以参考文档 *R 语言定义(R Language Definition)* 以得到关于这种机制更完整的讨论。





---

[^1]: 译者注：R 里面泛形函数和Java里面的接口(interface)行为最像。早期，我曾考虑用接口这个词来描述这个概念，但字面而言确实不妥。“泛型函数”的概念借鉴了候捷的翻译术语.
[^2]: 译者注：如果简单的键入这些方法名(如coef.aov)，R环境会报出错误信息 ‘‘Error: object "coef.aov" not found"。’