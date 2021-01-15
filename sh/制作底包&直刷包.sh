#制作底包&直刷包
  export m
  m=$0       
  echo "\033[32m制作底包&直刷包：\033[0m"
  echo "1.红米8/8a制作底包&直刷包
2.红米7/7a制作底包&直刷包
3.返回"
  read -p "请选择: " qz  
  if [ -z $qz ];then
  clear
  sh $0
  exit
  fi 
#1 
if [ $qz = '1' ];then
if [ ! -f ~/python/sh/"红米8&8a制作底包&直刷包".sh ];then
echo "\033[31m未检测到依赖脚本！\033[0m"
rm -rf ~/python
exit
fi
sh ~/python/sh/"红米8&8a制作底包&直刷包".sh
fi
#2
if [ $qz = '2' ];then
if [ ! -f ~/python/sh/"红米7&7a制作底包&直刷包".sh ];then
echo "\033[31m未检测到依赖脚本！\033[0m"
rm -rf ~/python
exit
fi
sh ~/python/sh/"红米7&7a制作底包&直刷包".sh
fi
#3
if [ $qz = '3' ];then
   cd $af
   clear
   sh $mian  
   exit
fi