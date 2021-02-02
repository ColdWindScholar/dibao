#打包img
  echo "\033[32m打包img：\033[0m"
  echo "1.打包system
2.打包vendor
3.返回"
   read -p "请选择: " dabao
   if [ -z $dabao ];then
   clear  
   sh $0
   exit
   fi
#1   
   if [ $dabao = '1' ];then
   if [ $os = 'Android' ];then   
   if [ ! -f ~/python/e2fsdroid ];then
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
 fi
   if [ $os = 'GNU/Linux' ];then
   if [ ! -f ~/python/e2fsdroid~ ];then
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
 fi 
   if [ $os = 'Android' ];then
   if [ ! -d /data/底包直刷包制作工具/system/system ];then
   echo "\033[33m注意！/data/底包直刷包制作工具的system文件夹为空！\033[0m"
   fi   
   if [ ! -f ~/python/e2fsdroid ];then
  echo "\033[31m$error\033[0m"
   rm -rf ~/python
   exit
   fi  
  fi
   if [ $os = 'GNU/Linux' ];then
   if [ ! -d /root/底包直刷包制作工具/system/system ];then
   echo "\033[33m注意！/root/底包直刷包制作工具的system文件夹为空！\033[0m"
   fi   
   if [ ! -f ~/python/e2fsdroid~ ];then
  echo "\033[31m$error\033[0m"
   rm -rf ~/python
   exit
   fi  
  fi      
   if [ $os = 'Android' ];then
   ssize=$(cat /data/底包直刷包制作工具/system/config/system_size.txt)
   fi
   if [ $os = 'GNU/Linux' ];then
   ssize=$(cat /root/底包直刷包制作工具/system/config/system_size.txt)
   fi   
   size=$(expr $ssize / 1024 / 1024 )
   read -p "自定义打包大小(直接按回车使用默认配置文件打包){不用带单位,默认单位:M}: " zdydbdx   
   if [ $zdydbdx ];then
   size=$zdydbdx
   fi
   sb=$(echo "${size}M")   
   read -p "是否打包system.img?[$sb](y/n): " mkesys
   if [ -z $mkesys ];then
   if [ $os = 'Android' ];then   
   echo "\033[32m正在打包system.img……\033[0m"   
   su -c ~/python/mke2fs -L / -t ext4 -b 4096 $bf/工作目录/IMG/system_new.img ${size}M   
   su -c ~/python/e2fsdroid -e -T 0 -S /data/底包直刷包制作工具/system/config/system_file_contexts -C /data/底包直刷包制作工具/system/config/system_fs_config  -a /system -f /data/底包直刷包制作工具/system/system $bf/工作目录/IMG/system_new.img
   fi
   if [ $os = 'GNU/Linux' ];then
   echo "\033[32m正在打包system.img……\033[0m"   
   ~/python/mke2fs~ -L / -t ext4 -b 4096 $bf/工作目录/IMG/system_new.img ${size}M   
   ~/python/e2fsdroid~ -e -T 0 -S /root/底包直刷包制作工具/system/config/system_file_contexts -C /root/底包直刷包制作工具/system/config/system_fs_config  -a /system -f /root/底包直刷包制作工具/system/system $bf/工作目录/IMG/system_new.img
   fi      
   fi         
   if [ $mkesys = 'y' ];then  
   if [ $os = 'Android' ];then   
   echo "\033[32m正在打包system.img……\033[0m"   
   su -c ~/python/mke2fs -L / -t ext4 -b 4096 $bf/工作目录/IMG/system_new.img ${size}M   
   su -c ~/python/e2fsdroid -e -T 0 -S /data/底包直刷包制作工具/system/config/system_file_contexts -C /data/底包直刷包制作工具/system/config/system_fs_config  -a /system -f /data/底包直刷包制作工具/system/system $bf/工作目录/IMG/system_new.img
   fi
   if [ $os = 'GNU/Linux' ];then
   echo "\033[32m正在打包system.img……\033[0m"   
   ~/python/mke2fs~ -L / -t ext4 -b 4096 $bf/工作目录/IMG/system_new.img ${size}M   
   ~/python/e2fsdroid~ -e -T 0 -S /root/底包直刷包制作工具/system/config/system_file_contexts -C /root/底包直刷包制作工具/system/config/system_fs_config  -a /system -f /root/底包直刷包制作工具/system/system $bf/工作目录/IMG/system_new.img
   fi      
   fi
   if [ $mkesys = 'n' ];then
   echo "\033[32m不打包\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
   if [ $? = '1' ];then
   echo "\033[31m打包失败！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
   echo "\033[32m打包成功！生成到工作目录/IMG文件夹内。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
#2
   if [ $dabao = '2' ];then
   if [ $os = 'Android' ];then   
   if [ ! -f ~/python/e2fsdroid ];then
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
 fi
   if [ $os = 'GNU/Linux' ];then
   if [ ! -f ~/python/e2fsdroid~ ];then
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
 fi 
   if [ $os = 'Android' ];then
   if [ ! -d /data/底包直刷包制作工具/vendor/vendor ];then
   echo "\033[33m注意！/data/底包直刷包制作工具的vendor文件夹为空！\033[0m"
   fi   
   if [ ! -f ~/python/e2fsdroid ];then
  echo "\033[31m$error\033[0m"
   rm -rf ~/python
   exit
   fi  
  fi
   if [ $os = 'GNU/Linux' ];then
   if [ ! -d /root/底包直刷包制作工具/vendor/vendor ];then
   echo "\033[33m注意！/root/底包直刷包制作工具的vendor文件夹为空！\033[0m"
   fi   
   if [ ! -f ~/python/e2fsdroid~ ];then
  echo "\033[31m$error\033[0m"
   rm -rf ~/python
   exit
   fi  
  fi      
   if [ $os = 'Android' ];then
   ssize=$(cat /data/底包直刷包制作工具/vendor/config/vendor_size.txt)
   fi
   if [ $os = 'GNU/Linux' ];then
   ssize=$(cat /root/底包直刷包制作工具/vendor/config/vendor_size.txt)
   fi   
   size=$(expr $ssize / 1024 / 1024 )
   read -p "自定义打包大小(直接按回车使用默认配置文件打包){不用带单位,默认单位:M}: " zdydbdx   
   if [ $zdydbdx ];then
   size=$zdydbdx
   fi   
   sb=$(echo "${size}M")
   read -p "是否打包vendor.img?[$sb](y/n): " mkesys
   if [ -z $mkesys ];then
   if [ $os = 'Android' ];then   
   echo "\033[32m正在打包vendor.img……\033[0m"   
   su -c ~/python/mke2fs -L / -t ext4 -b 4096 $bf/工作目录/IMG/vendor_new.img ${size}M   
   su -c ~/python/e2fsdroid -e -T 0 -S /data/底包直刷包制作工具/vendor/config/vendor_file_contexts -C /data/底包直刷包制作工具/vendor/config/vendor_fs_config  -a /vendor -f /data/底包直刷包制作工具/vendor/vendor $bf/工作目录/IMG/vendor_new.img
   fi
   if [ $os = 'GNU/Linux' ];then
   echo "\033[32m正在打包vendor.img……\033[0m"   
   ~/python/mke2fs~ -L / -t ext4 -b 4096 $bf/工作目录/IMG/vendor_new.img ${size}M   
   ~/python/e2fsdroid~ -e -T 0 -S /root/底包直刷包制作工具/vendor/config/vendor_file_contexts -C /root/底包直刷包制作工具/vendor/config/vendor_fs_config  -a /vendor -f /root/底包直刷包制作工具/vendor/vendor $bf/工作目录/IMG/vendor_new.img
   fi      
   fi         
   if [ $mkesys = 'y' ];then  
   if [ $os = 'Android' ];then   
   echo "\033[32m正在打包vendor.img……\033[0m"   
   su -c ~/python/mke2fs -L / -t ext4 -b 4096 $bf/工作目录/IMG/vendor_new.img ${size}M   
   su -c ~/python/e2fsdroid -e -T 0 -S /data/底包直刷包制作工具/vendor/config/vendor_file_contexts -C /data/底包直刷包制作工具/vendor/config/vendor_fs_config  -a /vendor -f /data/底包直刷包制作工具/vendor/vendor $bf/工作目录/IMG/vendor_new.img
   fi
   if [ $os = 'GNU/Linux' ];then
   echo "\033[32m正在打包vendor.img……\033[0m"   
   ~/python/mke2fs~ -L / -t ext4 -b 4096 $bf/工作目录/IMG/vendor_new.img ${size}M   
   ~/python/e2fsdroid~ -e -T 0 -S /root/底包直刷包制作工具/vendor/config/vendor_file_contexts -C /root/底包直刷包制作工具/vendor/config/vendor_fs_config  -a /vendor -f /root/底包直刷包制作工具/vendor/vendor $bf/工作目录/IMG/vendor_new.img
   fi      
   fi
   if [ $mkesys = 'n' ];then
   echo "\033[32m不打包\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
   if [ $? = '1' ];then
   echo "\033[31m打包失败！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
   echo "\033[32m打包成功！生成到工作目录/IMG文件夹内。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
#3
   if [ $dabao = '3' ];then
   cd $af
   clear  
   sh $mian
   exit   
   fi   