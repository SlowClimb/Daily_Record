### 指针
+ 简介
+ 指针是什么
 - 类别
 - 差异
+ 指针使用
 - 同类类型指针数据访问
 - 不同类型指针数据访问
 - 差异
+ 总结
 - 知识点
 - 困难点

##### 1. 简介
指针是C语言提供的一种能够直接操控任意内存数据的一种方法。

##### 2. 指针是什么
> C程序设计语言
>> 指针是一种保存变量地址的变量

###### 2.1 类别
```
void *func(){};
int *pNum = NULL;
char szBuf[1024] = {0};
```
###### 2.2 差异

| 对比项 | 保存数据 | 加一跨度 | 数据访问 |  |
| ------ | ------ | ------ | ------ | ------ |
| *func | 函数在内存中地址 | \  | \ |  |
| *pNum | 指向元素在内存的地址 | sizeof(int) | *pNum |  |
| szBuf | 数组内存地址 | sizeof(char)  | szBuf[n] |  |

特别注意：&szBuf + 1, 会向后移动sizeof(array)个字节。
&是获取元素在内存中的位置，故&szBuf 与 szBuf值相同。但是 &szBuf会将地址类型格式化为其定义类型(array),加一会向后移动sizeof(array)个字节。


##### 3. 指针使用
地址所占字节数是固定的，32位4字节，64位8字节。

###### 3.1 基本类型指针
```
int *pNum = NULL;
int a = 10;

pNum = &a;
printf("address:%p\t value:%d\n", a, &a);
printf("address:%p\t value:%d\n", pNum, *pNum);
```
64位平台 Gcc 5.4.0 运行结果
> address:0x7fffc18ef1bc	 value:10 \
> address:0x7fffc18ef1bc	 value:10
###### 3.2 复合类型指针
```
typedef struct stNode
{
  int iLen;
  char szBuf[16];
}Node_s;

Node_s stNode = {0};
Node_s *pstNode = NULL;

stNode.iLen = 15;
memcpy(stNode.szBuf, "ComplexStruct", sizeof(char)*16);

pstNode = &stNode;

printf("address:%p\t value:%d\t string:%s\n", &stNode, stNode.iLen, stNode.szBuf);
printf("address:%p\t value:%d\t string:%s\n", pstNode, pstNode->iLen, pstNode->szBuf);
```

64位平台 Gcc 5.4.0 运行结果：
> address:0x7ffc603fce20	 value:15	 string:ComplexStruct \
> address:0x7ffc603fce20	 value:15	 string:ComplexStruct

###### 3.3 函数类型指针
```

```


###### 3.4 不同类型指针

###### 3.4.1
int类型与char类型,工程中对数字划分，每部分代表其各自含义如下

| 模块 | 序号 |  数据类型 | 索引 |
| ---- | ---- | -------- | ---- |
| 8bit | 6bit |  6bit | 12bit |

```
  unsigned int iCmoid = 427937802;
  unsigned char *pPart = (unsigned char*)(void*)&iCmoid;

  printf("module:%d\n",(unsigned char *)pPart++);
  printf("id:%d\n",(unsigned char *)pPart++);
  printf("data type:%d\n",( )pPart);
  printf("index:%d\n",()pPart);

```


###### 3.4.2
