# 12.2.2 Hershey 矢量字体

 函数 `text` 和 `contour` 可以使用 `Hershey` 矢量字体。使用`Hershey` 矢量字体有三个理由：

* Hershey 字体会产生更好的输出，特别在计算机屏幕上，或者用于旋转以及小字体时。
* Hershey 字体提供一些标准字体库没有的字体。如星座记号，地图符号和天文学符号。
* Hershey 字体提供西里尔字符(cyrillic)和日语字符(假名和日本汉字)。 更多的信息(包括 R 里面的 Hershey 字符列表)可以通过如下命令得到：

```R
> help(Hershey)
> demo(Hershey)
> help(Japanese)
> demo(Japanese)
```