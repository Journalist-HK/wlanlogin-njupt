# drcom-njupt
## 使用 cURL 命令自动登录校园网
**2021-05-27更新：**
* 原来命令里面用了单引号不能自动替换变量但是不知道为什么可以正常工作。现在改好了。
* 添加了自动识别网卡的功能

**2021-03-14更新：**
* 本学期系统似乎做出了一些改动，需要加上用户IP，也就是路由器WAN口的IP，记得把`eth0.2`换成你的路由器的网卡（OpenWrt一般是`eth0.2`）

**2020-09-09更新：**
* 本学期系统似乎做出了一些改动，`wlanacip`和`wlanacname`两项不能同时为`null`，至少需要指定一项，这个例子中指定了`wlanacname=XL-BRAS-SR8806-X`，可以根据情况自行修改
* 删掉了一些没用的参数
---
请将运营商、学号、密码替换成相应内容

* 电信 = `njxy`
* 移动 = `cmcc`
* 校园网 = 留空

参考：
>[Dr.COM校园网多设备解决方案——路由器 Padavan/LuCI 固件自动网页认证+Telegram Bot 定时发送连接情况](https://jakting.com/archives/drcom-autologin-padavan-tgbot.html)
