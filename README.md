## 派蒙Bot——延续 / PaimonBot Continuation

基于[Mrs4s](https://github.com/Mrs4s) / [go-cqhttp](https://github.com/Mrs4s/go-cqhttp)
和 [nonebot](https://github.com/nonebot) / [nonebot2](https://github.com/nonebot/nonebot2) 的原神QQ群聊机器人

#### 前言

由于原作者已经退游，且不再维护[PaimonBot](https://github.com/XiaoMiku01/PaimonBot)，本项目作为[PaimonBot](https://github.com/XiaoMiku01/PaimonBot)的Fork，将继续开发新功能，进行Bug修复

![The End by XiaoMiku01.png](https://i.loli.net/2021/07/16/8MtJwCoDH2SRUhr.png)

<details>
<summary>原作者的小引</summary>
推荐关注几个非常可爱有趣的女孩！ <br/>
欢迎B站搜索:  ↓<br/>
<a href="https://space.bilibili.com/672328094/">@嘉然今天吃什么</a>&emsp;<a href="https://space.bilibili.com/672346917/">@向晚大魔王</a>&emsp;&emsp;<a href="https://space.bilibili.com/672342685/">@乃琳Queen</a>&emsp;&emsp;&emsp;<a href="https://space.bilibili.com/672353429/">@贝拉kira</a>&emsp;&emsp;&emsp;<a href="https://space.bilibili.com/351609538/">@珈乐Carol</a><br/>
<img src="https://i2.hdslb.com/bfs/face/d399d6f5cf7943a996ae96999ba3e6ae2a2988de.jpg@128w_128h_1o.webp" /><img src="https://i0.hdslb.com/bfs/face/566078c52b408571d8ae5e3bcdf57b2283024c27.jpg@128w_128h_1o.webp" /><img src="https://i1.hdslb.com/bfs/face/8895c87082beba1355ea4bc7f91f2786ef49e354.jpg@128w_128h_1o.webp" /><img src="https://i2.hdslb.com/bfs/face/668af440f8a8065743d3fa79cfa8f017905d0065.jpg@128w_128h_1o.webp" /><img src="https://i1.hdslb.com/bfs/face/a7fea00016a8d3ffb015b6ed8647cc3ed89cbc63.jpg@128w_128h_1o.webp" />
</details>

#### 特别鸣谢

[小灰灰](https://github.com/MiniGrayGay) 的人物武器信息api

### 环境

请务必使用**Python3.7**以上版本！！

尽量在linux下运行，windows下可能会有各种报错。

### 更新记录

2021-7-16 『派蒙Bot——延续』项目开始<br>
2021-5-29 防刷屏功能<br>
2021-5-22 更新1.5下版本材料（替换src/data文件夹即可） 2021-5-2 更新1.5版本周本材料  
2021-4-29 修复米游社资料查询失败  
2021-4-9 修复CD bug ,增加防闪照，新撤回涩图机制用法 回复Bot:撤回@发涩图指令的人  
2021-4-7 更新武器资料,修复windows下路径bug  
2021-4-6 修复Bug,增加涩图cd功能,默认60秒，在.env文件设置时间，超级用户不受影响  
2021-4-5 优化涩图速度增加，增加涩图关键词搜索  
2021-4-3 全部移植到nonebot2,增加防撤回，戳一戳等功能  
.  
.  
.  
2021-3-14 第一次更新

### 部署方法

1 .卸载以前的nonebot

```shell
pip3 uninstall nonebot
```

2.安装依赖库

```shell
pip3 install -r requirements.txt
```

3.在.env和.env.dev文件中设置所需的cookie和SUPERUSERS(超级用户)

4.配置go-cqhttp 详细请观看[go-cqhttp官方文档](https://docs.go-cqhttp.org/) 和 [nonebot2官方文档](https://v2.nonebot.dev/)   
注意！！PaimonBot连接端口为9898  
注意！！PaimonBot连接端口为9898  
注意！！PaimonBot连接端口为9898

5.运行Bot.py

```shell
python3 bot.py
```

6.搭建成功，发送help获取菜单  
<img src="https://github.com/XiaoMiku01/PaimonBot/blob/main/doc/help.png" width="250px" />

### 目前功能

1.米游社资料查询  
![mys.png](https://i.loli.net/2021/07/16/Eo3ATqJl9Uievg7.png)
2.每日副本查询  
![challenge.png](https://i.loli.net/2021/07/16/gpaUMGukdyw51qn.png)3.角色资料查询  
![character.png](https://i.loli.net/2021/07/16/BJCZPEflqHGjYcv.png)
![character2.png](https://i.loli.net/2021/07/16/s3jFfOp8EDkShYX.png)

4.在线运行代码(目前支持py / js / c / c++ / c# / java)  
![code.png](https://i.loli.net/2021/07/16/fVF5lSB7izW6Txs.png)
5.群聊防撤回，戳一戳回复  
![other.png](https://i.loli.net/2021/07/16/UwF3yXPOILoit5Y.png)
6.~~涩图~~(不稳定,望谅解！ps超级用户可以回复**撤回**可以撤回最后一条涩图)

### 注意事项

1.Bot账号请勿使用低等级小号，会导致风控使信息发不出来  
2.若想稳定运行，请在服务器挂一个星期左右   
3.将config.hjson文件中的消息分片打开可降级被风控的概率，不过会导致撤回涩图功能失效

```config.hjson
// 是否强制分片发送消息
// 分片发送将会带来更快的速度
// 但是兼容性会有些问题
force_fragmented: true
```

### 写在最后

本人能力较低，有些代码写的可能比较烂，请大佬亲喷，谢谢！

发现什么bug或者想要功能欢迎大家提iss和Pr。

由于本人是初中生，学业繁忙，这个项目的bug和功能不能及时更新，望谅解，谢谢！