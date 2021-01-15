#杂项
   echo "\033[32m杂项：\033[0m"
   echo "1.修改system(要root)
2.修改vendor(要root)
3.调整system.img的大小
4.调整vendor.img的大小
5.返回"
   read -p "请选择: " ab
  if [ -z $ab ];then
  clear  
  sh $0
  exit
  fi   
#1
   if [ $ab = '1' ];then
   read -p "是否修改system.img?(y/n): " system
   if [ -z $system ];then
   if [ ! -d $bf/工作目录/未完成/直刷包 ];then
   mkdir $bf/工作目录/未完成/直刷包
   fi   
   read -p "请将raw格式的system.img放到工作目录/未完成/直刷包里，按任意键继续" me
   echo "\033[33m(linux用户忽略)请在面具》设置》挂载命名空间模式选择全局命名空间，否则挂载了看不见里面的文件(如果是第一次设置请关闭一次Termux再打开重新执行一下脚本)。\033[0m"
   read -p "按任意键继续" xg
   if [ ! -f $bf/工作目录/未完成/直刷包/system.img ];then
   echo "\\033[31m修改失败！请确认system.img是否已放到工作目录/未完成/直刷包里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   if [ $os = 'Android' ];then   
   su -c mount -o remount -rw /
   su -c mkdir /工作目录 /工作目录/system
   su -c losetup /dev/block/loop5 $bf/工作目录/未完成/直刷包/system.img
   su -c mount /dev/block/loop5 /工作目录/system
   fi
   if [ $os = 'GNU/Linux' ];then   
   mount -o remount -rw /
   mkdir /工作目录 /工作目录/system 
   losetup /dev/loop5 $bf/工作目录/未完成/直刷包/system.img
   mount /dev/loop5 /工作目录/system   
   fi
   echo "\033[32msystem.img已挂载到根目录/工作目录/system里，请自行修改\033[0m"
   read -p "如果修改完成了请按任意键继续（2-1）" xg
   read -p "如果真的修改完成了请再按一下继续（2-2）" xg
   if [ $os = 'Android' ];then   
   su -c umount -fl /工作目录/system
   su -c rmdir  /工作目录/system /工作目录
   fi
   if [ $os = 'GNU/Linux' ];then   
   umount -fl /工作目录/system & losetup -d /dev/loop5
   rmdir  /工作目录/system /工作目录
   fi
   echo "\033[32m修改已完成！\033[0m"  
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0    
   exit        
  fi
     
  if [ $system = 'y' ];then
   if [ ! -d $bf/工作目录/未完成/直刷包 ];then
   mkdir $bf/工作目录/未完成/直刷包
   fi   
   read -p "请将raw格式的system.img放到工作目录/未完成/直刷包里，按任意键继续:" me
   echo "\033[33m(linux用户忽略)请在面具》设置》挂载命名空间模式选择全局命名空间，否则挂载了看不见里面的文件(如果是第一次设置请关闭一次Termux再打开重新执行一下脚本)。\033[0m"
   read -p "按任意键继续" xg
   if [ ! -f $bf/工作目录/未完成/直刷包/system.img ];then
   echo "\\033[31m修改失败！请确认system.img是否已放到工作目录/未完成/直刷包里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   if [ $os = 'Android' ];then   
   su -c mount -o remount -rw /
   su -c mkdir /工作目录 /工作目录/system
   su -c losetup /dev/block/loop5 $bf/工作目录/未完成/直刷包/system.img
   su -c mount /dev/block/loop5 /工作目录/system
   fi
   if [ $os = 'GNU/Linux' ];then
   mount -o remount -rw /
   mkdir /工作目录 /工作目录/system 
   losetup /dev/loop5 $bf/工作目录/未完成/直刷包/system.img
   mount /dev/loop5 /工作目录/system   
   fi
   echo "\033[32msystem.img已挂载到根目录/工作目录/system里，请自行修改\033[0m"
   read -p "如果修改完成了请按任意键继续（2-1）" xg
   read -p "如果真的修改完成了请再按一下继续（2-2）" xg
   if [ $os = 'Android' ];then   
   su -c umount -fl /工作目录/system
   su -c rmdir  /工作目录/system /工作目录
   fi
   if [ $os = 'GNU/Linux' ];then   
   umount -fl /工作目录/system & losetup -d /dev/loop5
   rmdir  /工作目录/system /工作目录
   fi
   echo "\033[32m修改已完成！\033[0m"  
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0    
   exit        
  fi
   if [ $system = 'n' ];then
   echo "\033[31m不修改\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
  fi   
#2
   if [ $ab = '2' ];then
   read -p "是否修改vendor.img？(y/n): " vendor
   if [ -z $vendor ];then
   if [ ! -d $bf/工作目录/未完成/底包 ];then
   mkdir $bf/工作目录/未完成/底包
   fi      
   read -p "请将raw格式的vendor.img放到工作目录/未完成/底包里，按任意键继续:" me   
   echo "\033[33m(linux用户忽略)请在面具》设置》挂载命名空间模式选择全局命名空间，否则挂载了看不见里面的文件(如果是第一次设置请关闭一次Termux再打开重新执行一下脚本)。\033[0m"
   read -p "按任意键继续" xg
   if [ ! -f $bf/工作目录/未完成/底包/vendor.img ];then
   echo "\\033[31m修改失败！请确认vendor.img是否已放到工作目录/未完成/底包里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   if [ $os = 'Android' ];then
   su -c mount -o remount -rw /
   su -c mkdir /工作目录 /工作目录/vendor   
   su -c losetup /dev/block/loop4 $bf/工作目录/未完成/底包/vendor.img
   su -c mount /dev/block/loop4 /工作目录/vendor
   fi
   if [ $os = 'GNU/Linux' ];then   
   mount -o remount -rw /
   mkdir /工作目录 /工作目录/vendor   
   losetup /dev/loop4 $bf/工作目录/未完成/底包/vendor.img
   mount /dev/loop4 /工作目录/vendor   
   fi
   echo "\033[32mvendor.img已挂载到根目录/工作目录/vendor里，请自行修改\033[0m"
   read -p "如果修改完成了请按任意键继续（2-1）" xg
   read -p "如果真的修改完成了请再按一下继续（2-2）" xg
   if [ $os = 'Android' ];then
   su -c umount -fl /工作目录/vendor
   su -c rmdir  /工作目录/vendor /工作目录
   fi
   if [ $os = 'GNU/Linux' ];then   
   umount -fl /工作目录/vendor & losetup -d /dev/loop4
   rmdir  /工作目录/vendor /工作目录
   fi
   echo "\033[32m修改已完成！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0 
   exit     
  fi
      
   if [ $vendor = 'y' ];then
   if [ ! -d $bf/工作目录/未完成/底包 ];then
   mkdir $bf/工作目录/未完成/底包
   fi      
   read -p "请将raw格式的vendor.img放到工作目录/未完成/底包里，按任意键继续:" me   
   echo "\033[33m(linux用户忽略)请在面具》设置》挂载命名空间模式选择全局命名空间，否则挂载了看不见里面的文件(如果是第一次设置请关闭一次Termux再打开重新执行一下脚本)。\033[0m"
   read -p "按任意键继续" xg
   if [ ! -f $bf/工作目录/未完成/底包/vendor.img ];then
   echo "\\033[31m修改失败！请确认vendor.img是否已放到工作目录/未完成/底包里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   if [ $os = 'Android' ];then   
   su -c mount -o remount -rw /
   su -c mkdir /工作目录 /工作目录/vendor   
   su -c losetup /dev/block/loop4 $bf/工作目录/未完成/底包/vendor.img
   su -c mount /dev/block/loop4 /工作目录/vendor
   fi
   if [ $os = 'GNU/Linux' ];then   
   mount -o remount -rw /
   mkdir /工作目录 /工作目录/vendor   
   losetup /dev/loop4 $bf/工作目录/未完成/底包/vendor.img
   mount /dev/loop4 /工作目录/vendor   
   fi
   echo "\033[32mvendor.img已挂载到根目录/工作目录/vendor里，请自行修改\033[0m"
   read -p "如果修改完成了请按任意键继续（2-1）" xg
   read -p "如果真的修改完成了请再按一下继续（2-2）" xg
   if [ $os = 'Android' ];then   
   su -c umount -fl /工作目录/vendor 
   su -c rmdir  /工作目录/vendor /工作目录
   fi
   if [ $os = 'GNU/Linux' ];then   
   umount -fl /工作目录/vendor & losetup -d /dev/loop4
   rmdir  /工作目录/vendor /工作目录
   fi
   echo "\033[32m修改已完成！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0 
   exit     
   fi
   if [ $vendor = 'n' ];then
   echo "\033[31m不修改\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
  fi
#3
if [ $ab = '3' ];then
   read -p "是否调整system.img的大小？(y/n):" tz
   if [ -z $tz ];then
   read -p "请将raw格式的system.img放到工作目录文件夹里,按任意键继续" make   
   if [ ! -f $bf/工作目录/system.img ];then
   echo "\033[31m未检测到system.img，请确认system.img是否已放到工作目录里。\033[0m"
   read -p "按任意键返回" make   
   cd $af
   clear
   sh $0     
   exit
   fi
   read -p "请输入要调整system.img的大小(不用带单位):" vt
   e2fsck -fy $bf/工作目录/system.img
   resize2fs -f $bf/工作目录/system.img ${vt}m
   if [ $? = '0' ];then
   echo "\033[32m已调整，请检查img文件的大小是否和输入的数值一致。\033[0m"
   else
   echo "\033[31m调整失败，请检查输入数值是否大于镜像文件里的真实文件大小。\033[0m"   
   fi
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
   if [ $tz = 'n' ];then
   echo "\033[31m不调整\033[0m"   
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0
   exit
 fi   
   if [ $tz = 'y' ];then
   read -p "请将raw格式的system.img放到工作目录文件夹里,按任意键继续" make   
   if [ ! -f $bf/工作目录/system.img ];then
   echo "\033[31m未检测到system.img，请确认system.img是否已放到工作目录里。\033[0m"
   read -p "按任意键返回" make   
   cd $af
   clear
   sh $0     
   exit
   fi
   read -p "请输入要调整system.img的大小(不用带单位):" vt
   e2fsck -fy $bf/工作目录/system.img
   resize2fs -f $bf/工作目录/system.img ${vt}m
   if [ $? = '0' ];then
   echo "\033[32m已调整，请检查img文件的大小是否和输入的数值一致。\033[0m"
   else
   echo "\033[31m调整失败，请检查输入数值是否大于镜像文件里的真实文件大小。\033[0m"   
   fi
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
   if [ $tz = 'n' ];then
   echo "\033[31m不调整\033[0m"   
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0
   exit
   fi   
fi      
#4
if [ $ab = '4' ];then
   read -p "是否调整vendor.img的大小？(y/n):" tz
   if [ -z $tz ];then
   read -p "请将raw格式的vendor.img放到工作目录文件夹里,按任意键继续" make   
   if [ ! -f $bf/工作目录/vendor.img ];then
   echo "\033[31m未检测到vendor.img，请确认vendor.img是否已放到工作目录里。\033[0m"
   read -p "按任意键返回" make   
   cd $af
   clear
   sh $0     
   exit
   fi
   read -p "请输入要调整vendor.img的大小(不用带单位):" vt
   e2fsck -fy $bf/工作目录/vendor.img
   resize2fs -f $bf/工作目录/vendor.img ${vt}m
   if [ $? = '0' ];then
   echo "\033[32m已调整，请检查img文件的大小是否和输入的数值一致。\033[0m"
   else
   echo "\033[31m调整失败，请检查输入数值是否大于镜像文件里的真实文件大小。\033[0m"   
   fi   
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
 fi   
   if [ $tz = 'y' ];then
   read -p "请将raw格式的vendor.img放到工作目录文件夹里,按任意键继续" make   
   if [ ! -f $bf/工作目录/vendor.img ];then
   echo "\033[31m未检测到vendor.img，请确认vendor.img是否已放到工作目录里。\033[0m"
   read -p "按任意键返回" make   
   cd $af
   clear
   sh $0     
   exit
   fi
   read -p "请输入要调整vendor.img的大小(不用带单位):" vt
   e2fsck -fy $bf/工作目录/vendor.img
   resize2fs -f $bf/工作目录/vendor.img ${vt}m
   if [ $? = '0' ];then
   echo "\033[32m已调整，请检查img文件的大小是否和输入的数值一致。\033[0m"
   else
   echo "\033[31m调整失败，请检查输入数值是否大于镜像文件里的真实文件大小。\033[0m"   
   fi
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
   if [ $tz = 'n' ];then
   echo "\033[31m不调整\033[0m"   
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0
   exit
   fi   
fi      

#5
if [ $ab = '5' ];then
   cd $af
   clear
   sh $mian
   exit
   fi