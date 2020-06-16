# 12.6.1 排版文档用的 PostScript 图表

通过将参数 `file` 传递给 `postscript()` 设备驱动函数，你可以在你选择的文件中以 PostScript 形式保存图片。图片会被横行放置，但你可以设定参数 `horizontal=FALSE` 使得图片纵向放置。图形大小将通过参数 `width` 和 `height` 设置(图形会被适当调整以适合参数要求)。例如，命令

```R
> postscript("file.ps", horizontal=FALSE, height=5, pointsize=10)
```

将产生一个高为5英寸以PostScript 格式编码的图片文件。特别要提醒的是，如果命令中的文件名已经存在，原来的文件将会被覆盖。在同一目录下的 R 会话中，一定要小心先前创建的文件名字。

PostScript 输出的图片常常用于插入其他文档中。此时最好采用*封装的(encapsulated)*PostScript 图片：R 常常产生构造性的输出(conformant output)，但是只在 `onefile=FALSE` 参数提供时才以标记输出。这种奇怪的用法和 S 不兼容：它实际上表示输出将会是单页的(这是 `EPSF` 规范的一部分)。因此对于内插图片的生成可以采用下面的命令[^1]：

```R
> postscript("plot1.eps", horizontal=FALSE, onefile=FALSE, height=8, width=6, pointsize=10)
```





---

[^1]: 译者注：我是用 GSview 查看 PostScript 文件的，所以对以 PostScript 格式的图片我都用这个软件直接转换了。效果还是不错的。