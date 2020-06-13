# 10.7 作用域

这一部分的内容相对本文档其他部分的内容更偏向一些技术性的问题。但是它会澄清 S-PLUS 和 R 一些重要的差异。

函数内部的变量可以分为三类：形式参数(formal parameters)，局部变量(local variables)和自由变量(free variables)。形式参数是出现在函数的参数列表中的变量。 它们的值由实际的函数参数*绑定*形式参数的过程决定的。局部变量由函数内部表达式的值决定的。既不是形式参数又不是局部变量的变量是自由变量。自由变量如果被赋值将会变成局部变量。观察下面的函数定义过程，

```R
f <- function(x) {
  y <- 2*x
  print(x)
  print(y)
  print(z)
}
```

在这个函数中，`x` 是形式参数，`y` 是局部变量，`z` 是自由变量。

在 R 里面，可以利用函数被创建的环境中某个变量的第一次出现解析一个自由变量的绑定。这称为词法*作用域(lexical scope)*。我们可以定义一个函数 `cube`，

```R
cube <- function(n) {
  sq <- function() n*n
  n*sq()
}
```

函数 `sq` 中的变量 `n` 不是函数的参数。因此它是自由变量。一些作用域的原则可以用来确定和它相关的值。在静态作用域(S-PLUS)中，这个值指的是一个和全局变量 `n` 相关的值。在词法作用域(R)中，它指的是函数 `cube` 的参数。因为当 `sq` 定义的时候， 它会动态绑定参数 `n`。在 R 里面解析和在 S-PLUS 里面解析不同点在于 S-PLUS 搜索全局变量 `n` 而 R 首先寻找函数 `cube` 调用时所创建的环境中的变量 `n`。

```R
## 首先用 S 解析
S> cube(2)
Error in sq(): Object "n" not found Dumped
S> n <- 3
S> cube(2)
[1] 18
## 同样的函数在 R 中解析
R> cube(2)
[1] 8
```

词汇作用域会给予函数*可变状态(mutable state)*。下面的例子演示 R 如何模仿一个银行的帐户。真正的银行帐户必须同时有跟踪收支平衡或者总额的变量，提供提款业务，取款业务和显示当前余额的函数。我们可以在 `account` 里面创建三个函数， 然后返回一个包含它们的的列表。当调用 `account` 时，它读入一个数值参数 `total`， 并且返回一个包含三个函数的列表。因为这些函数时定义在一个有变量 `total` 的环境中，它们可以访问它的值。

`<<-` 是一个特别的赋值操作符，它用来更改和 `total` 相关的值。这个操作符会回溯到一个含有标识符 `total` 的封闭环境中。当它找到这个环境，它会用操作符右边的值替换环境中这个变量的值。如果在全局变量或者最高层次的环境中仍然没有找到标识符 `total`，那么该变量就会被创建并且在那里被赋值。大多数用户用 `<<-` 创建全局变量，并且把操作符右边的值赋给它[^1]。仅仅当 `<<-` 用于一个函数的输出是另外一个函数的输入时，这里描述的独特行为才会出现。

```R
open.account <- function(total) {
  list(
    deposit = function(amount) {
      if(amount <= 0)
        stop("Deposits must be positive!\n")
      total <<- total + amount
      cat(amount, "deposited.  Your balance is", total, "\n\n")
    },
    withdraw = function(amount) {
      if(amount > total)
        stop("You don't have that much money!\n")
      total <<- total - amount
      cat(amount, "withdrawn.  Your balance is", total, "\n\n")
    },
    balance = function() {
      cat("Your balance is", total, "\n\n")
    }
  )
}

ross <- open.account(100)
robert <- open.account(200)

ross$withdraw(30)
ross$balance()
robert$balance()

ross$deposit(50)
ross$balance()
ross$withdraw(500)
```





---

[^1]: 从某种意义上来说，这样做有点模仿S-PLUS 的用法，因为在 S-PLUS 中，这种操作符就是创建全局变量并且进行赋值操作。

