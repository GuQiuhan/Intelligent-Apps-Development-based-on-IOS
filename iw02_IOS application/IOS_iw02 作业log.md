### IOS_iw02 作业log

##### 作业笔记

* 结构布局

  Main文件中，有一个tabViewController管理了五个tab，每一个tab里面又有一个NavigationViewController来管理，除了第五个（关于），其他tab都是共享一个页面（新闻展示）

  

* 修改info list源码来降低安全性，使得可以访问其他网站不会报错

* URL loading system

  * 使用url session去拉取数据、下载文件、上传数据

    

* 使用WKWebView展示Web页面

  

* URL:统一资源定位符

  * 许多应用程序都有访问文件的需求。也许是应用 bundle 或文件系统的文件，又或许是网上的资源。在代码里需要调用某些方法来指向这些文件。对于 Apple 平台而言，基本上只有两个选择：使用 String 或 NSURL。

    使用过地址栏或任何终端的话，Swift 字符串将是一个非常容易理解的选择。我的意思是，所有的文本都是在地址栏的，对吧？Cocoa 和 Cocoa Touch SDK 中一些较旧的 API 都接收 NSURL 和字符串（通常在这些 API 中称为“路径”）作为参数，但是都越来越朝着只使用 NSURL 的方向发展。和 String 路径相比，NSURL 有许多优点，最明显的是可以访问 URL 各个部分的属性，而不必另外编写代码来从路径的字符串解析出这些组件。

  * 将常量string转换为URL`let url=URL(string:self.Url)!`



##### swift笔记

* 变量只分为可变与不可变
  * Var 可变
  * let不可变

* Optional类型

  * ```swift
    var num: Int?
    // let num2 : Int? // let类型变量只可被初始化一次
    
    //以上声明的意思是：声明了一个变量，它的值可能是一个 Int 值，也可能为 nil 。也即，实际上声明的是 Optional 类型的变量，而不是声明了一个 Int 类型的。
    
    num = 10
    if num is Optional<Int> { 
    //在IDE中的if上一定会出现这样一个warning：'is' test is always true。也就是说 num 不是 Int 类型，而是 Optional 类型。
      print("它是可选类型")
    } else {
      print("它是Int类型")
    }
    ```

  * 关于解包：

    解包符号为 !

    如果确定一个可选类型的值一定存在，那么我们使用 ！进行解包来获取它的值，或者使用 Optional Binding 来处理。

    ```swift
    let possiablestring: String? = "An possiable string"
    print(possiablestring!) 
    // 强制解包 确定possiablestring的值确实存在，不需要每次都验证它的值 let strValues = possiablestring!.hashValue
    ```

    也可以把 **隐式解包可选类型** 当成对每次使用的时候自动解包的可选类型。隐式解包不是每次使用的时候 在变量/常量后面加 ！，而是直接在定义的时候加 ！。

    ```swift
    let assumString: String! = "an optional string"
    print(assumString, assumString.hashValue)
    ```

    > ! 的使用场景：
    >
    > 1. 强制对 可选选类变量 进行解包；
    > 2. 声明 隐式解包的可选类型变量 的时候, 一般用于类中的属性。

* 与其他编程语言所不同的是，Swift 并不要求你为自定义类去创建独立的接口和实现文件。你所要做的是在一个单一文件中定义一个类，系统会自动生成面向其它代码的外部接口。

  

### 控制View

<img src="/Users/nju/Library/Application Support/typora-user-images/截屏2022-11-23 下午4.37.34.png" alt="截屏2022-11-23 下午4.37.34" style="zoom:50%;" />