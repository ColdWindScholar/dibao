#解包img
   echo "\033[32m解包img：\033[0m"
   echo "1.解包system.img
2.解包vendor.img
3.解包product.img
4.返回" 
   read -p "请选择: " jb
   if [ -z $jb ];then
   clear  
   sh $0
   exit
   fi
#1
   if [ $jb = '1' ];then
   if [ ! -d $bf/工作目录/IMG ];then
   mkdir $bf/工作目录/IMG
   fi
   if [ $os = 'Android' ];then   
   if [ ! -d /data/底包直刷包制作工具 ];then
   su -c mkdir /data/底包直刷包制作工具
   fi      
   if [ ! -d /data/底包直刷包制作工具/system ];then
   su -c mkdir /data/底包直刷包制作工具/system
   fi  
   fi 
   if [ $os = 'GNU/Linux' ];then
   if [ ! -d /root/底包直刷包制作工具 ];then
   mkdir /root/底包直刷包制作工具
   fi      
   if [ ! -d /root/底包直刷包制作工具/system ];then
   mkdir /root/底包直刷包制作工具/system
   fi     
   fi
   if [ ! -f ~/python/imgextractor.py ];then
   rm -rf ~/python
   echo "正在初始化……"  
   read -p "正在初始化(不需要挂t)，是否继续？(y/n): " c
   if [ -z $c ];then
  $install
  $github
   fi   
   if [ $c = 'y' ];then
  $install
  $github
   fi
   if [ $c = "n" ];then
   echo "\033[31m已取消\033[0m" 
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
 fi     
   if [ ! -f ~/python/imgextractor.py ];then
  echo "\033[31m$error\033[0m"
   rm -rf ~/python
   exit
   fi  
   read -p "请将raw格式的system.img放到工作目录/IMG文件夹里，按任意键继续" img
   echo "\033[32m正在解包……\033[0m"
   if [ ! -f $bf/工作目录/IMG/system.img ];then
   echo "\033[33m未检测到system.img，请确认是否已把system.img放到工作目录/IMG文件夹里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
   if [ $os = 'Android' ];then   
   su -c  ~/../usr/bin/python3 ~/python/imgextractor.py  $bf/工作目录/IMG/system.img  /data/底包直刷包制作工具/system
   fi
   if [ $os = 'GNU/Linux' ];then
   python3 ~/python/imgextractor.py  $bf/工作目录/IMG/system.img  /root/底包直刷包制作工具/system
   fi  
   if [ $? = '1' ];then
   echo "\033[31m解包失败！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
   if [ $os = 'Android' ];then   
   echo "\033[32m解包完成！生成到/data/底包直刷包制作工具/system文件夹\033[0m"
   fi
   if [ $os = 'GNU/Linux' ];then
   echo "\033[32m解包完成！生成到/root/底包直刷包制作工具/system文件夹\033[0m"
   fi   
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
#2
   if [ $jb = '2' ];then
   if [ ! -d $bf/工作目录/IMG ];then
   mkdir $bf/工作目录/IMG
   fi
   if [ $os = 'Android' ];then   
   if [ ! -d /data/底包直刷包制作工具 ];then
   su -c mkdir /data/底包直刷包制作工具
   fi      
   if [ ! -d /data/底包直刷包制作工具/vendor ];then
   su -c mkdir /data/底包直刷包制作工具/vendor
   fi  
   fi 
   if [ $os = 'GNU/Linux' ];then
   if [ ! -d /root/底包直刷包制作工具 ];then
   mkdir /root/底包直刷包制作工具
   fi      
   if [ ! -d /root/底包直刷包制作工具/vendor ];then
   mkdir /root/底包直刷包制作工具/vendor
   fi     
   fi
   if [ ! -f ~/python/imgextractor.py ];then
   rm -rf ~/python
   echo "正在初始化……"  
   read -p "正在初始化(不需要挂t)，是否继续？(y/n): " c
   if [ -z $c ];then
  $install
  $github
   fi   
   if [ $c = 'y' ];then
  $install
  $github
   fi
   if [ $c = "n" ];then
   echo "\033[31m已取消\033[0m" 
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
 fi     
   if [ ! -f ~/python/imgextractor.py ];then
  echo "\033[31m$error\033[0m"
   rm -rf ~/python
   exit
   fi  
   read -p "请将raw格式的vendor.img放到工作目录/IMG文件夹里，按任意键继续" img
   echo "\033[32m正在解包……\033[0m"
   if [ ! -f $bf/工作目录/IMG/vendor.img ];then
   echo "\033[33m未检测到vendor.img，请确认是否已把vendor.img放到工作目录/IMG文件夹里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
   if [ $os = 'Android' ];then   
   su -c  ~/../usr/bin/python3 ~/python/imgextractor.py  $bf/工作目录/IMG/vendor.img  /data/底包直刷包制作工具/vendor
   fi
   if [ $os = 'GNU/Linux' ];then
   python3 ~/python/imgextractor.py  $bf/工作目录/IMG/vendor.img  /root/底包直刷包制作工具/vendor
   fi  
   if [ $? = '1' ];then
   echo "\033[31m解包失败！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
   if [ $os = 'Android' ];then   
   echo "\033[32m解包完成！生成到/data/底包直刷包制作工具/vendor文件夹\033[0m"
   fi
   if [ $os = 'GNU/Linux' ];then
   echo "\033[32m解包完成！生成到/root/底包直刷包制作工具/vendor文件夹\033[0m"
   fi   
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
#3
   if [ $jb = '3' ];then
   if [ ! -d $bf/工作目录/IMG ];then
   mkdir $bf/工作目录/IMG
   fi
   if [ $os = 'Android' ];then   
   if [ ! -d /data/底包直刷包制作工具 ];then
   su -c mkdir /data/底包直刷包制作工具
   fi      
   if [ ! -d /data/底包直刷包制作工具/product ];then
   su -c mkdir /data/底包直刷包制作工具/product
   fi  
   fi 
   if [ $os = 'GNU/Linux' ];then
   if [ ! -d /root/底包直刷包制作工具 ];then
   mkdir /root/底包直刷包制作工具
   fi      
   if [ ! -d /root/底包直刷包制作工具/product ];then
   mkdir /root/底包直刷包制作工具/product
   fi     
   fi
   if [ ! -f ~/python/imgextractor.py ];then
   rm -rf ~/python
   echo "正在初始化……"  
   read -p "正在初始化(不需要挂t)，是否继续？(y/n): " c
   if [ -z $c ];then
  $install
  $github
   fi   
   if [ $c = 'y' ];then
  $install
  $github
   fi
   if [ $c = "n" ];then
   echo "\033[31m已取消\033[0m" 
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
 fi     
   if [ ! -f ~/python/imgextractor.py ];then
  echo "\033[31m$error\033[0m"
   rm -rf ~/python
   exit
   fi  
   read -p "请将raw格式的product.img放到工作目录/IMG文件夹里，按任意键继续" img
   echo "\033[32m正在解包……\033[0m"
   if [ ! -f $bf/工作目录/IMG/product.img ];then
   echo "\033[33m未检测到product.img，请确认是否已把product.img放到工作目录/IMG文件夹里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
   if [ $os = 'Android' ];then   
   su -c  ~/../usr/bin/python3 ~/python/imgextractor.py  $bf/工作目录/IMG/product.img  /data/底包直刷包制作工具/product
   fi
   if [ $os = 'GNU/Linux' ];then
   python3 ~/python/imgextractor.py  $bf/工作目录/IMG/product.img  /root/底包直刷包制作工具/product
   fi  
   if [ $? = '1' ];then
   echo "\033[31m解包失败！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
   if [ $os = 'Android' ];then   
   echo "\033[32m解包完成！生成到/data/底包直刷包制作工具/product文件夹\033[0m"
   fi
   if [ $os = 'GNU/Linux' ];then
   echo "\033[32m解包完成！生成到/root/底包直刷包制作工具/product文件夹\033[0m"
   fi   
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
#4
   if [ $jb = '4' ];then
   cd $af
   clear
   sh $mian 
   exit
   fi