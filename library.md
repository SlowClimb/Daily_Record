## 简介

+ 静态库

&emsp;&emsp;&emsp;&emsp;发布的应用程序是lib模块和其他模块组成的一个整体。

+ 动态库

&emsp;&emsp;&emsp;&emsp;发布的应用程序的同时也会发布对应动态链接库。


## 编译

+ 静态库

&emsp;&emsp;&emsp;&emsp;函数和数据编译成.lib。

+ 动态库

&emsp;&emsp;&emsp;&emsp;函数和数据编译为两部分: .lib（导入库文件）、.DLL。.lib是函数和变量的映射表，.DLL是实际函数和数据。

## 链接

+ 静态库

&emsp;&emsp;&emsp;&emsp; .lib和其他模块何为一个整体。

+ 动态库

&emsp;&emsp;&emsp;&emsp;映射表与其他模块何为一个整体。

## 发布

+ 静态库

&emsp;&emsp;&emsp;&emsp; 仅有一个.exe。

+ 动态库

&emsp;&emsp;&emsp;&emsp;有.exe和对应DLL库。

## 加载

+ 静态库

&emsp;&emsp;&emsp;&emsp; 完全加载。

+ 动态库

&emsp;&emsp;&emsp;&emsp; 按需加载。
