## 概述
Makefile文件作为Linux平台开发多文件编译构建语法，实现自动化编译。

## 目录结构
+ 语法规则
+ 执行流程





### 语法规则
```
#最终目标 ： 依赖
#    执行命令

targets : depenendcy
  command;
```
命令一定是tab起始。

### 执行流程
```
1 : 2
  3
```
make根据 make 目标执行命令。

```
clean:
  rm -rf *.o *.tmp

make clean
```
clean作为最终目标文件，当前目录下不存在clean，执行rm -rf *.o *.tmp
