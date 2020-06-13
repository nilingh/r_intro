# 4.1 一个特别的例子

假定我们有一份来自澳大利亚所有州和行政区的30个税务会计师的信息样本[^1] 以及他们各自所在地的州名。州名以字符串向量的形式保存在 state 中

```R
> state <- c("tas", "sa", "qld", "nsw", "nsw", "nt", "wa", "wa", "qld", "vic", "nsw", "vic", "qld", "qld", "sa", "tas", "sa", "nt", "wa", "vic", "qld", "nsw", "nsw", "wa", "sa", "act", "nsw", "vic", "vic", "act")
```

注意在字符向量中，“有序”意味着以字母排序的[^2]。 因子可以简单地用函数 `factor()` 创建：

```R
> statef <- factor(state)
```

函数 `print()` 处理因子和其他对象有点不同:

```R
> statef
[1] tas sa qld nsw nsw nt wa wa qld vic nsw vic qld qld sa
[16] tas sa nt wa vic qld nsw nsw wa sa act nsw vic vic act
Levels: act nsw nt qld sa tas vic wa
```

函数 `levels()` 可以用来得到因子的水平(levels)。 

```R
> levels(statef)
[1] "act" "nsw" "nt"  "qld" "sa"  "tas" "vic" "wa"
```





---

[^1]: 澳大利亚的8个州和行政区分别是 Australian Capital Territory, New South Wales, the Northern Territory, Queensland, South Australia, Tasmania, Victoria 和Western Australia。
[^2]: 译者注: 如果是汉字, 可能情况就复杂了ˆ ˆ。