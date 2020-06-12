# 6.3.1 创建数据框

 可以通过函数 `data.frame` 创建符合上面对列(分量)限制的数据框对象：

```R
> accountants <- data.frame(home=statef, loot=incomes, shot=incomef)
```

符合数据框限制的列表可被函数 `as.data.frame()` 强制转换成数据框。

从外部文件读取一个数据框最简单的方法是使用函数 `read.table()`。这个将在从文件中读取数据部分详细讨论。