# 1.9 重新调用和修正先前的命令

在大多数 UNIX 版本和 Windows 系统上， R 提供了一种调用和重新执行先前用 过的命令的机制。键盘的上下键可以使光标在命令的历史记录(command history) 中前翻或者后退。一旦找到某条具体的命令，光标可以通过左右键移动，而且可以插 入其他字符或者用 DEL 键删除字符。更具体的内容可以参考附录命令行编辑器。

UNIX 下面对以前用过命令的调用和编辑的键设置是可以修改的，具体内容可以参考 **readline** 库的指南。

特别提一下，Emacs 文本编辑器[^1]对交互使用 R 提供了更一般的机制(主要是ESS 和Emacs Speaks Statistics)。具体可以参见R的问题集: R 常见问题集。





---

[^1]:译者注:当然Vi，UltraEdit也不错。我就用UltraEdit写 R 代码做蒙特卡罗模拟的。在http:// www.ultraedit.com/index.php?name=Content&pa=showpage&pid=40下载 R 的wordfile (“R Scripting - 02/18/2003”，具体可能会有些不同)，贴到你的UltraEdit 程序根目录下的wordfile.txt 文件中就行 了。这时候，自动会对 R 文件语法高亮显示。