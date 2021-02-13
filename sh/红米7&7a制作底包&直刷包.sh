#红米7/7a制作底包&直刷包
  echo "\033[32m红米7/7a制作底包&直刷包：\033[0m"
  echo "1.制作整合直刷包
2.制作底包
3.制作直刷包
4.返回"
  read -p "请选择: " ba
  if [ -z $ba ];then
  clear  
  sh $0  
  exit
  fi 
#1
  if [ $ba = '1' ];then
  if [ ! -d $bf/工作目录/未完成/整合直刷包 ];then
  mkdir $bf/工作目录/未完成/整合直刷包
  fi
  if [ ! -d ~/python ];then  
  echo "正在初始化……"
  
  read -p "正在初始化(不需要挂t)，是否继续？(y/n): " Initialization
  if [ -z $Initialization ];then
  $install
  $github
  fi     
  
  if [ $Initialization = 'y' ];then
  $install
  $github
  fi
  if [ $Initialization = "n" ];then
  echo "\033[31m已取消\033[0m" 
  read -p "已取消，按任意键返回" make
  cd $af
  clear
  sh $0 
  exit 
  fi
  fi
  if [ ! -d ~/python/整合直刷包 ];then
  echo "\033[31m$error\033[0m"
  rm -rf ~/python
  exit
  fi
  if [ ! -d $bf/工作目录/未完成/整合直刷包/META-INF ];then
  cp -r ~/python/整合直刷包/* $bf/工作目录/未完成/整合直刷包
  fi  
  echo "\033[32m初始化已完成！\033[0m"
  ii=$(echo "\033[32mraw格式已修改好的\033[0m")
  read -p "请将${ii}boot.img、vendor.img、system.img放到工作目录/未完成/整合直刷包里,按任意键继续" make
  echo "\033[32m正在制作整合直刷包……\033[0m"   
   if [ ! -f $bf/工作目录/未完成/整合直刷包/vendor.img ];then
   echo "\033[31m整合直刷包制作失败！请确认是否已把boot.img、vendor.img、system.img移动到工作目录/未完成/整合直刷包文件夹里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0
   exit
   fi
   if [ ! -f $bf/工作目录/未完成/整合直刷包/system.img ];then
   echo "\033[31m整合直刷包制作失败！请确认是否已把boot.img、vendor.img、system.img移动到工作目录/未完成/整合直刷包文件夹里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0
   exit
   fi
   echo "\033[32m正在把vendor.img转为.dat…\033[0m"
   python ~/python/rimg2sdat.py $bf/工作目录/未完成/整合直刷包/vendor.img -o $bf/工作目录/未完成/整合直刷包/ -v 4
   if [ $? = '1' ];then
   echo "\033[31m转换dat失败！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
   mv $bf/工作目录/未完成/整合直刷包/system.new.dat $bf/工作目录/未完成/整合直刷包/vendor.new.dat   
   mv $bf/工作目录/未完成/整合直刷包/system.transfer.list $bf/工作目录/未完成/整合直刷包/vendor.transfer.list      
   echo "\033[32m转换完成！\033[0m"
   echo "\033[32m正在把vendor.new.dat转为.br……\033[0m"
   read -p "请选择br的压缩级别（ 0-11 数字越大br体积越小，压缩时间更长，或者按回车使用默认等级压缩:0）: " ysdj
   if [ $ysdj ];then
   brotli -q $ysdj $bf/工作目录/未完成/整合直刷包/vendor.new.dat -o $bf/工作目录/未完成/整合直刷包/vendor.new.dat.br
   else
   brotli -q 0 $bf/工作目录/未完成/整合直刷包/vendor.new.dat -o $bf/工作目录/未完成/整合直刷包/vendor.new.dat.br
   fi
   if [ $? = '1' ];then
   echo "\033[31m转换br失败！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   echo "\033[32mbr转换完成！\033[0m"
   rm -rf $bf/工作目录/未完成/整合直刷包/vendor.new.dat
   rm -rf $bf/工作目录/未完成/整合直刷包/vendor.img
   touch $bf/工作目录/未完成/整合直刷包/vendor.patch.dat   
   echo "\033[32m正在把system.img转为.dat……\033[0m"
   python ~/python/rimg2sdat.py $bf/工作目录/未完成/整合直刷包/system.img -o $bf/工作目录/未完成/整合直刷包/ -v 4
   if [ $? = '1' ];then
   echo "\033[31m转换dat失败！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
   echo "\033[32m转换完成！\033[0m"
   echo "\033[32m正在把system.new.dat转为.br……\033[0m"
   read -p "请选择br的压缩级别（ 0-11 数字越大br体积越小，压缩时间更长，或者按回车使用默认等级压缩:0）: " ysdj
   if [ $ysdj ];then
   brotli -q $ysdj $bf/工作目录/未完成/整合直刷包/system.new.dat -o $bf/工作目录/未完成/整合直刷包/system.new.dat.br
   else
   brotli -q 0 $bf/工作目录/未完成/整合直刷包/system.new.dat -o $bf/工作目录/未完成/整合直刷包/system.new.dat.br
   fi
   if [ $? = '1' ];then
   echo "\033[31m转换br失败！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   echo "\033[32mbr转换完成！\033[0m"
   rm -rf $bf/工作目录/未完成/整合直刷包/system.new.dat
   rm -rf $bf/工作目录/未完成/整合直刷包/system.img
   touch $bf/工作目录/未完成/整合直刷包/system.patch.dat
   read -p "请输入整合直刷包包名（不带后缀）: " zh  
   if [ -z $zh ];then
   echo "\033[32m正在压缩整合直刷包……\033[0m"
   cd $bf/工作目录/未完成/整合直刷包
   zip -r "$bf/工作目录/已完成/整合直刷包/我的整合直刷包.zip" ./*
   else
   echo "正在压缩整合直刷包"
   cd $bf/工作目录/未完成/整合直刷包
   zip -r "$bf/工作目录/已完成/整合直刷包/$zh.zip" ./*
   fi
   echo "\033[32m整合直刷包制作完成！\033[0m"
   cd ~
   read -p "整合直刷包已制作完成，是否把包移到脚本所在路径并清理工作目录？(y/n): " drm
   if [ -z $drm ];then
   echo "\033[32m不删除\033[0m"  
   read -p "整合直刷包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit   
   fi   
   if [ $drm = "y" ];then
   mv $bf/工作目录/已完成/整合直刷包/*.zip $bf
   rm -rf $bf/工作目录/未完成/整合直刷包
   read -p "整合直刷包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit      
   fi
   if [ $drm = "n" ];then
   echo "\033[32m不删除\033[0m"  
   read -p "整合直刷包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit   
   fi
   fi

#2
  if [ $ba = '2' ];then
  if [ ! -d $bf/工作目录/未完成/底包 ];then
  mkdir $bf/工作目录/未完成/底包
  fi  
  if [ ! -d ~/python ];then
  echo "正在初始化……"
  
  read -p "正在初始化(不需要挂t)，是否继续？(y/n): " Initialization
  if [ -z $Initialization ];then
  $install
  $github
  fi     
  
  if [ $Initialization = 'y' ];then
  $install
  $github
  fi
  if [ $Initialization = "n" ];then
  echo "\033[31m已取消\033[0m" 
  read -p "已取消，按任意键返回" make
  cd $af
  clear
  sh $0 
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

  
  if [ ! -d $bf/工作目录/未完成/底包/META-INF ];then
  cp -r ~/python/底包/* $bf/工作目录/未完成/底包
  fi
  
   
   
  echo "\033[32m初始化已完成！\033[0m"
   read -p "请将raw格式的boot.img、vendor.img放到工作目录/未完成/底包里,按任意键继续" make
   echo "正在制作底包"   
   if [ ! -f $bf/工作目录/未完成/底包/vendor.img ];then
   echo "\033[31m底包制作失败！请确认是否已把boot.img、vendor.img移动到工作目录/未完成/底包文件夹里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0
   exit
   fi
   read -p "是否调整vendor.img的大小?(y/n): " tzvendor
   if [ -z $tzvendor ];then
   .
   fi
   if [ $tzvendor = 'y' ];then
   read -p "请输入底包vendor的大小（7:1024M，7A:1024M 不用带单位，或者按回车使用默认大小:1024M）: " vsize
   if [ $vsize ];then
   e2fsck -fy $bf/工作目录/未完成/底包/vendor.img
   resize2fs -f $bf/工作目录/未完成/底包/vendor.img ${vsize}m
   if [ $? = '0' ];then
   echo "\033[33m请检查img文件的大小是否和输入的数值一致。\033[0m"
   else
   echo "\033[31m调整失败，请检查输入数值是否大于镜像文件里的真实文件大小。\033[0m"   
   exit
   fi   
   else
   e2fsck -fy $bf/工作目录/未完成/底包/vendor.img
   resize2fs -f $bf/工作目录/未完成/底包/vendor.img 1536m   
   resize2fs -f $bf/工作目录/未完成/底包/vendor.img 1024m
   if [ $? = '0' ];then
   echo "\033[33m请检查img文件的大小是否和输入的数值一致。\033[0m"
   else
   echo "\033[31m调整失败，请检查输入数值是否大于镜像文件里的真实文件大小。\033[0m" 
   exit  
   fi   
   fi
   fi
   if [ $tzvendor = 'n' ];then
   echo "\033[32m不调整\033[0m"
   fi
   read -p "如需定制刷入文字请修改未完成/底包里的updater-script文件，按任意键继续" db
   read -p "请输入底包包名（不带后缀）: " vcompression
   if [ -z $vcompression ];then
   echo "正在压缩底包"
   cd $bf/工作目录/未完成/底包
   zip -r "$bf/工作目录/已完成/底包/我的底包.zip" ./*
   else
   echo "正在压缩底包"
   cd $bf/工作目录/未完成/底包
   zip -r "$bf/工作目录/已完成/底包/$vcompression.zip" ./*
   fi
   echo "\033[32m底包制作完成！\033[0m"
   cd ~
   read -p "底包已制作完成，是否把底包移到脚本所在路径并清理工作目录？(y/n): " drm
   if [ -z $drm ];then
   echo "\033[32m不删除\033[0m"  
   read -p "底包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit   
   fi   
   if [ $drm = "y" ];then
   mv $bf/工作目录/已完成/底包/*.zip $bf
   rm -rf $bf/工作目录/未完成/底包
   read -p "底包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit      
   fi
   if [ $drm = "n" ];then
   echo "\033[32m不删除\033[0m"  
   read -p "底包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit   
   fi
   fi
 
#3
if [ $ba = '3' ];then 
  if [ ! -d $bf/工作目录/未完成/直刷包 ];then
  mkdir $bf/工作目录/未完成/直刷包  
  fi
  if [ ! -d ~/python ];then
  echo "正在初始化……"
  
  read -p "正在初始化(不需要挂t)，是否继续？(y/n): " Initialization
  if [ -z $Initialization ];then
  $install
  $github
  fi  
  if [ $Initialization = 'y' ];then
  $install
  $github
  fi
  if [ $Initialization = "n" ];then
  echo "\033[31m已取消\033[0m" 
  read -p "按任意键返回" make
  cd $af
  clear
  sh $0 
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

  
  if [ ! -d $bf/工作目录/未完成/直刷包/META-INF ];then
  cp -r ~/python/直刷包/* $bf/工作目录/未完成/直刷包
  fi
   
   
  echo "\033[32m初始化已完成！\033[0m"
   read -p "请将raw格式的system.img放到工作目录/未完成/直刷包里,按任意键继续" make
   echo "正在制作直刷包"   
   if [ ! -f $bf/工作目录/未完成/直刷包/system.img ];then
   echo "\033[31m直刷包制作失败！请确认是否已把system.img移动到工作目录/未完成/直刷包文件夹里。\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   read -p "是否调整system.img的大小?(y/n): " tzsystem
   if [ -z $tzsystem ];then
   echo "\033[32m不调整\033[0m"
   fi   
   if [ $tzsystem = 'y' ];then   
   read -p "请输入直刷包system的大小（7:3584M，7A:3072M 不用带单位，或者按回车使用默认大小:3584M）: " ssize
   if [ $ssize ];then
   e2fsck -fy $bf/工作目录/未完成/直刷包/system.img
   resize2fs -f $bf/工作目录/未完成/直刷包/system.img ${ssize}m
   if [ $? = '0' ];then
   echo "\033[33m请检查img文件的大小是否和输入的数值一致。\033[0m"
   else
   echo "\033[31m调整失败，请检查输入数值是否大于镜像文件里的真实文件大小。\033[0m"   
   exit
   fi   
   else
   e2fsck -fy $bf/工作目录/未完成/直刷包/system.img
   resize2fs -f $bf/工作目录/未完成/直刷包/system.img 4096m   
   resize2fs -f $bf/工作目录/未完成/直刷包/system.img 3584m
   if [ $? = '0' ];then
   echo "\033[33m请检查img文件的大小是否和输入的数值一致。\033[0m"
   else
   echo "\033[31m调整失败，请检查输入数值是否大于镜像文件里的真实文件大小。\033[0m"   
   exit
   fi      
   fi
   fi
   if [ $tzsystem = 'n' ];then
   echo "\033[32m不调整\033[0m"
   fi
   read -p "如需定制刷入文字请修改未完成/直刷包里的updater-script文件，按任意键继续" zsb
   echo "正在转换为dat"
   python ~/python/rimg2sdat.py $bf/工作目录/未完成/直刷包/system.img -o $bf/工作目录/未完成/直刷包/ -v 4
   if [ $? = '1' ];then
   echo "\033[31m转换dat失败！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
   echo "\033[32m转换完成！\033[0m"
   echo "正在转换为br"
   read -p "请选择br的压缩级别（ 0-11 数字越大br体积越小，压缩时间更长，或者按回车使用默认等级压缩:0）: " ysdj
   if [ $ysdj ];then
   brotli -q $ysdj $bf/工作目录/未完成/直刷包/system.new.dat -o $bf/工作目录/未完成/直刷包/system.new.dat.br
   else
   brotli -q 0 $bf/工作目录/未完成/直刷包/system.new.dat -o $bf/工作目录/未完成/直刷包/system.new.dat.br
   fi
   if [ $? = '1' ];then
   echo "\033[31m转换br失败！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   echo "\033[32mbr转换完成！\033[0m"
   rm -rf $bf/工作目录/未完成/直刷包/system.new.dat
   rm -rf $bf/工作目录/未完成/直刷包/system.img
   touch $bf/工作目录/未完成/直刷包/system.patch.dat
   read -p "请输入直刷包包名（不带后缀）: " scompression
   if [ -z $scompression ];then
   echo "正在压缩直刷包"
   cd $bf/工作目录/未完成/直刷包
   zip -r "$bf/工作目录/已完成/直刷包/我的直刷包.zip" ./*
   else
   echo "正在压缩直刷包"
   cd $bf/工作目录/未完成/直刷包
   zip -r "$bf/工作目录/已完成/直刷包/$scompression.zip" ./*   
   fi
   echo "\033[32m直刷包已制作完成！\033[0m"
   cd ~
   read -p "直刷包已制作完成，是否把直刷包移到脚本所在目录并清理工作目录？(y/n): " zrm
   if [ -z $zrm ];then
   echo "\033[32m不删除\033[0m"  
   read -p "直刷包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0 
   exit  
   fi   
   if [ $zrm = "y" ];then
   mv $bf/工作目录/已完成/直刷包/*.zip $bf
   rm -rf $bf/工作目录/未完成/直刷包
   read -p "直刷包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit   
   fi
   if [ $zrm = "n" ];then
   echo "\033[32m不删除\033[0m"  
   read -p "直刷包已制作完成，按任意键返回" make
   cd $af
   clear
   sh $0 
   exit  
   fi
fi
#4
   if [ $ba = '4' ];then
  clear  
  sh $m
  exit
fi
