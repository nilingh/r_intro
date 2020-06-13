# 7.3.1 从其他R包里面导入数据

为了访问某个特定包的数据，可以使用参数 `package`，例如

```R
data(package="rpart")
data(Puromycin, package="datasets")
```

如果一个包已经被 `library` 绑定，那么它的数据集会被自动地加入到 R 的搜索路径中去。

用户捐献的包含有非常丰富的数据集。