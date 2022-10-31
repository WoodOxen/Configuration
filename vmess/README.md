# 科学上网说明

由于众所周知的原因，科学上网的说明得悄悄进行。这些方法请在个人电脑上使用，为了保证信息安全，实验室服务器已经确保装不上这些了。

[v2ray是什么，原理请看这里](https://toutyrater.github.io/basic/vmess.html)

## Ubuntu

在ubuntu上，推荐的软件是[Qv2ray](https://github.com/Qv2ray/Qv2ray)，虽然已经停止维护了，但仍然挺好用的。

```
snap install qv2ray
```

然后把本路径下的v-core解压放到`~/snap/qv2ray/4576/.config/qv2ray`下

```
# 解压：extract v2ray-linux-64.zip

cp -r ./v2ray-linux-64 ~/snap/qv2ray/4576/.config/qv2ray/vcore
```

## Windows

在windows上，推荐的软件是[v2rayN](https://github.com/2dust/v2rayN)，该软件仍在活跃维护中

- [教程翻译](https://v2xtls.org/v2rayn-4-12%e9%85%8d%e7%bd%ae%e6%95%99%e7%a8%8b/)