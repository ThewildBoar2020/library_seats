# -
本项目运用到SSM+mysql技术。内容：本项目主要采用 B／S 架构，主要面对学生、老师及管理员三类角色。本项目主要分为两个部分，第一部分为权限管理功能，所有角色的角色的权限全都是可配置的，甚至连角色也可以自行添加；第二部分是系统应用功能，分为图书馆座位管理和系统附加功能，图书馆座位管理包括阅览室管理、座位生成、选座、信用积分管理等，系统附加功能包括通知公告、交流管理等。
# 图书馆预约占座系统

## 1、依赖环境

**jdk1.7和1.8**都可以

eclipse 配置**tomcat7**

**mysql5.7** 

**navicat**：数据库管理工具

## 2、运行步骤

1、导入项目

2、进入项目的properties-》 Java build path

![1657696289549](C:\Users\Boar\AppData\Roaming\Typora\typora-user-images\1657696289549.png)

接下来：

![1657696367387](C:\Users\Boar\AppData\Roaming\Typora\typora-user-images\1657696367387.png)

2、配置好Tomcat服务器

![1657696433325](C:\Users\Boar\AppData\Roaming\Typora\typora-user-images\1657696433325.png)

3、修改数据库的配置，改成自己的数据库名称和密码。

![1657696549796](C:\Users\Boar\AppData\Roaming\Typora\typora-user-images\1657696549796.png)

4、新建数据库db_library_seats，运行项目的数据库文件，导入即可，F5刷新。

![1657697480431](C:\Users\Boar\AppData\Roaming\Typora\typora-user-images\1657697480431.png)

5、运行项目，Run as->Run on server;输入http://localhost:8080/LibrarySeats/。

![1657697754603](C:\Users\Boar\AppData\Roaming\Typora\typora-user-images\1657697754603.png)

6、输入admin;密码:admin,进入管理界面

![1657698333802](C:\Users\Boar\AppData\Roaming\Typora\typora-user-images\1657698333802.png)
