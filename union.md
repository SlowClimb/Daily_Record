## 概述
 了解共用体

## 目标
+ 共用体的存储结构
+ 公用体在实际项目中用途

### 存储结构
公用体占用的内存大小为最大成员占用内存大小值

```
union Data
{
    int iNum;
    char cCh;
    short sNum;
};
```

共用体占用内存大小
```
printf("union data ram size:%d\n", sizeof(Data));
```

单个字节
```
union Data unData;

unData.iNum = 0x39;
printf("union data iNum :%d\tcCh :%d\tsNum :%d\n", unData.iNum, unData.cCh, unData.sNum);
```

双字节数据赋值
```
unData.iNum = 0x4041;
printf("union data iNum :%d\tcCh :%d\tsNum :%d\n", unData.iNum, unData.cCh, unData.sNum);
```

四字节数据赋值
```
unData.iNum = 0x40414243;
printf("union data iNum :%d\tcCh :%d\tsNum :%d\n", unData.iNum, unData.cCh, unData.sNum);
```
__结论__

### 实际用途
情形：教师与学生仅含有一项字段不同，score/course字段用共用体表示。

| name | old | sex | profession | score/course |
| ---- | ----- | ----- | -----| ----- |
| XuFei | 25 | m | s | 96 |
| WangYunFei | 23 | m | s | 93 |
| NouJianPei | 48 | m | t | 112 |

根据需求定义数据结构
```
typedef struct PersonInfo
{
    char szName[20];
    int iOld;
    bool bSex;
    bool bProfession;

    union Data{
      double iScore;
      double iCourse;
    }Contribution_U;

}PersonInfo_S;
```

数据录入
```
pstPersonInfo = malloc(sizeof(PersonInfo_S) * PERSONMAX);

for(i = 0; i < PERSONMAX; i++){
    scanf("%s %d %c %c", pstPersonInfo[i].name, &(pstPersonInfo[i].num), &(pstPersonInfo[i].sex), &(pstPersonInfo[i].profession));

    if(bodys[i].profession == 's')
    {  //学生
        scanf("%f", &pstPersonInfo[i].Contribution_U.score);
    }
    else
    {  //老师
        scanf("%s", &pstPersonInfo[i].Contribution_U.course);
    }

    fflush(stdin);
}

```

__结论__
