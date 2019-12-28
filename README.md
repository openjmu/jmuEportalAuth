# 集美大学 Eportal 认证 (JMU's Eportal Auth)

## 这是什么？ (What's this?)

此脚本为了集美大学的Web认证而开发，通过简单的'curl'模拟登录和注销功能（web认证有心跳保活但无需进行保活）。
This shell developed for JMU's web authentication. By using 'curl' to simulate login/logout (Web authentication has keepalive but we don't need it here).

## 运行环境？ (Running Environment?)

脚本以ash运行（也可以以bash运行），如果配套使用luci界面，必须编译为软件包ipk。脚本将被放置在OpenWrt的"/bin"或者Padavan的"/etc/storage"目录下。
Script based on shell, run with ash or bash. It can be compiled to normal package without hardware platform limitation. Script will be placed at "/bin" or "/etc/storage".

## 如何使用？ (How to use it?)

配套luci控制界面[luci-app-jmuEportalAuth](https://github.com/openjmu/luci-app-jmuEportalAuth)。
shell方法如下：

    Usage (使用方法):
        -h Get help information (获取帮助信息)
        -k Kill process (结束进程，会下线)

        -s Service Name (服务名称)
            0(教育网接入) / 1(电信宽带接入) / 2(联通宽带接入) / 3(移动宽带接入)
        -u Username (用户名) (工号/学号)
        -p Password (密码)

        -r Retry authentication with configured (已配置情况下重新认证)
    Example (示例):
        jmuEportalAuth -h
        jmuEportalAuth -k
        jmuEportalAuth -s 1 -u 学号 -p 密码
        jmuEportalAuth -r

## 补充说明 (PS)

Padavan用法：在/etc/storage里新建一个名为jmuEportalAuth的文件，然后复制脚本内容过去，再改用Padavan的```config_file```。

```bash
chmod +x /etc/storage/jmuEportalAuth
mtd_storage.sh save
/etc/storage/jmuEportalAuth -s X -u 学号 -p 密码 #X为0/1/2/3
mtd_storage.sh save
```

添加计划任务 (Add Crontab)：
在自定义设置-脚本-自定义 Crontab 定时任务配置那边加上：

```bash
10 6 * * * /etc/storage/jmuEportalAuth -r #6点10分认证
```

## 编译 (Make)

```bash
# 下载并解压 sdk
wget https://mirrors.tuna.tsinghua.edu.cn/lede/releases/17.01.6/targets/ar71xx/generic/lede-sdk-17.01.6-ar71xx-generic_gcc-5.4.0_musl-1.1.16.Linux-x86_64.tar.xz
tar xJf lede-sdk-17.01.6-ar71xx-generic_gcc-5.4.0_musl-1.1.16.Linux-x86_64.tar.xz
# Clone 项目
cd lede-sdk-17.01.6-ar71xx-generic_gcc-5.4.0_musl-1.1.16.Linux-x86_64
git clone https://github.com/openjmu/jmuEportalAuth package/jmuEportalAuth
# 选择要编译的包 Utilities -> [M]jmuEportalAuth
make menuconfig
# 开始编译
make package/jmuEportalAuth/compile V=99
```

## 关于 (About)

Based on [LGiki/RuijiePortalLoginTool](https://github.com/LGiki/RuijiePortalLoginTool)

Written By [Alex Vincent](https://blog.alexv525.com/)
