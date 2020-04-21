# 2.6 字符向量

在 R 中，常常会用到字符量和字符向量，如图上的标注。在使用的时候，它们用由双引号所界定的一个字符序列来表示，如 `"x-values"`，`"New iteration results"`。

字符串输入的时候既可以用双引号(`"`)又可以用单引号(`'`)，但是打印的时候则采用双引号(有时根本不用引号)。它们采用C 语言形式的转义控制序列(escape sequences)，用`\`表示转义字符，所以输入 `\\` 将会得到 `\\` 的输出，而想插入 `"` 则要输 入 `\"`。其他有用的转义字符有 `\n`(换行)，`\t`(制表符)和 `\b`(退格键)——参见 `?Quotes` 可查看完整清单。

通过函数 `c()`可以把几个字符向量连接成一个字符向量；这种用法的例子会常常出现。

函数 `paste()` 可以有任意多的参数，并且把它们一个接一个连成字符串。这些参数中的任何数字都将被显式地强制转换成字符串，而且以同样的方式在终端显示。默认的分隔符是单个的空格符，不过这可以被指定的参数修改，`sep=string` 就是将分隔符换成 `string` ，这个参数可以设为空。

例如

```R
> labs <- paste(c("X","Y"), 1:10, sep="")
```

使得 `labs` 变成一个字符向量。

```R
c("X1", "Y2", "X3", "Y4", "X5", "Y6", "X7", "Y8", "X9", "Y10")
```

Note particularly that recycling of short lists takes place here too; thus `c("X", "Y")` is repeated 5 times to match the sequence`1:10`. [9](https://cran.r-project.org/doc/manuals/r-release/R-intro.html#FOOT9)

特别要注意一下这里短的向量也发生了循环使用；因此 `c("X", "Y")` 重复了5次以吻合序列 `1:10` 。[^1]

---

[^1]: paste(..., collapse=ss) 会在每个结果生成的字符串元素后面加上 `ss`，例如，`ss <- "|"` 。R 有许多工具进行字符 处理，参见 `sub` 和 `substring` 的帮助文档。
