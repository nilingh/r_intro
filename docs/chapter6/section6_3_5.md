# 6.3.5 管理搜索路径

 函数 `search` 显示当前的搜索路径。它可以用来跟踪已被绑定或者绑定去除的列表和数据框(以及包)。最开始，它会给出 

```R
> search()
[1] ".GlobalEnv" "Autoloads"
```

其中 `.GlobalEnv` 是工作空间[^1]。 

`lentils` 被绑定后，我们可以看到

```R
> search()
[1] ".GlobalEnv" "lentils" "Autoloads" "package:base"
> ls(2)
[1] "u" "v" "w"
```

`ls` (或者 `objects`) 可以用来查看搜索路径中任何位置的内容。 最后，我们去除数据框的绑定，并且确证它是否已从搜索路径中去除了。

```R
> detach("lentils")
> search()
[1] ".GlobalEnv" "Autoloads" "package:base"
```





---

[^1]:第二个术语的意义可以参考autoload的帮助文件。