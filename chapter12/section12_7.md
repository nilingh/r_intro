# 12.7 动态图形

R 目前还没有提供内置的函数处理动态图形，如旋转散点云，“刷亮”(brushing)(交 互式高亮)图形[^1]等。但是，强大的动态图形函数可以从 Swayne，Cook 和 Buja 设计的 GGobi 系统中得到，相关的网址是

http://www.ggobi.org/

并且可以通过 R 的包 [**rggobi**](https://cran.r-project.org/package=rggobi) 直接访问，文档见http://ggobi.org/rggobi.html。另外，[**rgl**](https://cran.r-project.org/package=rgl) 包提供了绘制交互式3D图形的方法，例如表层(surfaces)绘制。





---

[^1]: 译者注：SAS等统计软件也有类似概念，指在散点图中，用拖动鼠标光标的方法拖出一个小长方形来选中数据点，同时会在另外一个散点图中高亮显示选中的点。