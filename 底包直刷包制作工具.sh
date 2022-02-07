#本工具依赖于Termux。
#linux可运行在ubuntu、debian等支持apt的系统。
#工具制作By rm-rf/*
#本工具依赖：https://github.com/yi985432/python
#工具最新版本及开源：https://github.com/yi985432/dibao-zhishuabao-tool
  export os root af bf error install github mian
  mian=$0         
  dangqian=V4.0  
  os=$(uname -o)
  root=$(id -u)
  af=$(pwd)
  bf=$(dirname $0) 
  if ( echo ${bf} |grep -q / );then
  .
  else 
  cd $af/$bf
  cf=$(pwd)
  bf=$cf
  fi
  if [ -b /dev/block/loop0 ];then
  if [ $os = 'Linux' ];then
  if [ $root = '0' ];then
  echo "\033[31m本工具在Android下不用root执行，请退出root后重试。\033[0m"
  exit
  fi
  fi  
 fi
if [ $os = 'Android' ];then
  if [ $root = '0' ];then
  echo "\033[31m本工具在Android下不用root执行，请退出root后重试。\033[0m"
  exit
  fi
  echo "\033[32m运行环境:Android\033[0m"  
  chmod -Rf 0777 ~/python
  fi
  if [ $os = 'GNU/Linux' ];then
  if [ $root -ne '0' ];then
  echo "\033[31m本工具运行要root，请切换到root用户后重试。\033[0m"
  exit
  fi
  echo "\033[32m运行环境:linux\033[0m"
  chmod -Rf 0777 ~/python
  fi
  error="初始化失败！请重试。
1.可能是网络问题。
2.可能是源问题，换一个国内源再重试。
3.可能是其他问题。"
  if [ $os = 'Android' ];then
  install="apt install git python brotli e2fsprogs zip -y"
  fi
  if [ $os = 'GNU/Linux' ];then
  install="apt install git python python3 brotli e2fsprogs zip -y"
  fi  
  github="git clone https://gitee.com/yi985432/python.git"
  cd ~
if [ ! -d ~/python ];then
  echo "正在初始化……"
  
  read -p "正在初始化(不需要挂t)，是否继续？(y/n): " Initialization
  if [ -z $Initialization ];then
  apt update
  apt upgrade
  $install
  $github
  fi   
  if [ $Initialization = 'y' ];then
  apt update
  apt upgrade
  $install 
  $github
  fi
  if [ $Initialization = "n" ];then
  echo "\033[31m已取消\033[0m" 
  exit 
  fi
fi  
if [ ! -d ~/python/底包 ];then
  echo "\033[31m$error\033[0m"
  rm -rf ~/python
  exit
  fi
  
if [ ! -d ~/python/直刷包 ];then
  echo "\033[31m$error\033[0m"
  rm -rf ~/python
  exit
  fi
  if [ ! -d $bf/工作目录 ];then
  mkdir $bf/工作目录
  mkdir $bf/工作目录/Br
  mkdir $bf/工作目录/DAT
  mkdir $bf/工作目录/IMG
  fi
  if [ ! -d $bf/工作目录/未完成 ];then
  mkdir $bf/工作目录/未完成
  mkdir $bf/工作目录/未完成/底包
  mkdir $bf/工作目录/未完成/直刷包
  mkdir $bf/工作目录/未完成/整合直刷包
  fi
  if [ ! -d $bf/工作目录/已完成 ];then
  mkdir $bf/工作目录/已完成
  mkdir $bf/工作目录/已完成/底包
  mkdir $bf/工作目录/已完成/直刷包
  mkdir $bf/工作目录/已完成/整合直刷包
  fi  
  echo "\033[32m
****************************************************
***欢迎使用底包&直刷包制作工具v4.0****
***作者:rm-rf/****
***作者QQ:3586563103****
***目前制作底包和直刷包已支持红米8/A&7/A****
***Android注意！本工具依赖于Termux****
***linux可运行在ubuntu、debian等支持apt的系统****
*****************************************************\033[0m"
  echo "工具选项:
         1.制作底包&直刷包
         2.解包img(root)
         3.打包img(root)
         4.转换system
         5.转换vendor
         6.杂项        
         7.清理工作目录
         8.检测版本更新
         88.退出
         "
  read -p "请选择: " xz
  if [ -z $xz ];then
   cd $af
   clear
   sh $0
   exit
  fi
#制作底包&直刷包
if [ $xz = '1' ];then
if [ ! -f ~/python/sh/"制作底包&直刷包".sh ];then
echo "\033[31m未检测到依赖脚本！\033[0m"
rm -rf ~/python
exit
fi
sh ~/python/sh/"制作底包&直刷包".sh
fi
#解包img
if [ $xz = '2' ];then
if [ ! -f ~/python/sh/解包img.sh ];then
echo "\033[31m未检测到依赖脚本！\033[0m"
rm -rf ~/python
exit
fi
sh ~/python/sh/解包img.sh
fi
#打包img
if [ $xz = '3' ];then
if [ ! -f ~/python/sh/打包img.sh ];then
echo "\033[31m未检测到依赖脚本！\033[0m"
rm -rf ~/python
exit
fi
sh ~/python/sh/打包img.sh
fi
#转换system
if [ $xz = '4' ];then
if [ ! -f ~/python/sh/转换system.sh ];then
echo "\033[31m未检测到依赖脚本！\033[0m"
rm -rf ~/python
exit
fi
sh ~/python/sh/转换system.sh
fi
#转换vendor
if [ $xz = '5' ];then
if [ ! -f ~/python/sh/转换vendor.sh ];then
echo "\033[31m未检测到依赖脚本！\033[0m"
rm -rf ~/python
exit
fi
sh ~/python/sh/转换vendor.sh   
fi
#杂项
if [ $xz = '6' ];then
if [ ! -f ~/python/sh/杂项.sh ];then
echo "\033[31m未检测到依赖脚本！\033[0m"
rm -rf ~/python
exit
fi
sh ~/python/sh/杂项.sh
fi
#清理工作目录
if [ $xz = '7' ];then
   read -p "清理工作目录,里面的文件将消失,是否继续？(y/n): " grm
   if [ -z $grm ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0
   exit   
   fi   
   if [ $grm = 'y' ];then
   rm -rf $bf/工作目录
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0
   exit      
   fi
   if [ $grm = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0
   exit   
   fi
fi
#检测版本更新
  if [ $xz = '8' ];then
  echo "\033[32m正在获取最新版本……\033[0m"
  git clone --depth=1 https://gitee.com/yi985432/python.git update -b update > /dev/null 2>&1
  banben=$(cat ~/update/update.txt)
  echo "\033[33m当前版本:$dangqian\033[0m"
  echo "\033[34m最新版本:$banben\033[0m"
  rm -rf ~/update
  if [ "$dangqian" = "$banben" ];then
  echo "\033[32m当前为最新版本。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit  
  else
  read -p "最新版本$banben是否更新？(y/n): " gengxin
  if [ -z $gengxin ];then
  echo "\033[32m懒得更新了。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
  fi  
  if [ $gengxin = 'y' ];then
  rm -rf ~/python
  git clone https://gitee.com/yi985432/python.git
  if [ $? !=  '0' ];then
  echo "\033[31m更新失败！
1.可能是网络不稳定
2.可能是源问题，换国内的试试
3.可能是其他问题"
  rm -rf ~/python
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
  fi
  echo "\033[32m更新完毕！\033[0m"
  read -p "是否替换旧脚本?(y/n): " tihuan
  if [ -z $tihuan ];then
  echo "\033[32m不替换\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi  
  if [ $tihuan = 'y' ];then
  cp ~/python/底包直刷包制作工具.sh $bf
  echo "\033[32m脚本已复制到当前目录。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
  if [ $tihuan = 'n' ];then
  echo "\033[32m不替换\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
  fi
  if [ $gengxin = 'n' ];then
  echo "\033[32m懒得更新了。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
  fi
fi
#退出
if [ $xz = '88' ];then
   exit
fi
