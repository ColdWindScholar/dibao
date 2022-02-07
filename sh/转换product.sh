#转换product
   echo "\033[32m转换product：\033[0m"
   echo "1.br转dat
2.dat转img
3.img转dat
4.dat转br
5.raw转sparse
6.sparse转raw
7.返回"
   read -p "请选择: " ven
   if [ -z $ven ];then
  clear  
  sh $0
  exit
   fi   
#1
if [ $ven = '1' ];then
   if [ ! -d $bf/工作目录/DAT ];then
   mkdir $bf/工作目录/DAT
   fi
   if [ ! -d $bf/工作目录/Br ];then
   mkdir $bf/工作目录/Br
   fi
   if [ ! -f $bf/工作目录/Br/product.transfer.list ];then
   .
   else
   mv $bf/工作目录/Br/product.transfer.list $bf/工作目录/DAT
   fi 
   read -p "请将product.new.dat.br文件放到工作目录/Br文件夹里，按任意键继续" br
   echo "\033[32m正在转为dat…\033[0m"
   if [ ! -f $bf/工作目录/Br/product.new.dat.br ];then
   echo "\033[31m转换dat失败！，请确认product.new.dat.br文件是否已移动到工作目录/Br里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
   brotli -d $bf/工作目录/Br/product.new.dat.br -o $bf/工作目录/DAT/product.new.dat
   echo "\033[32mdat已转换完成，生成到工作目录/DAT文件夹里。\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " xx
   if [ -z $xx ];then
   rm -rf $bf/工作目录/Br/product.new.dat.br
   read -p "已删除，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit   
   fi
   if [ $xx = 'y' ];then
   rm -rf $bf/工作目录/Br/product.new.dat.br
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit   
   fi
   if [ $xx = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
  fi
#2
if [ $ven = '2' ];then
   if [ ! -d $bf/工作目录/DAT ];then
   mkdir $bf/工作目录/DAT
   fi
   if [ ! -d $bf/工作目录/IMG ];then
   mkdir $bf/工作目录/IMG
   fi
   if [ ! -f ~/python/sdat2img.py ];then
   rm -rf ~/python
   echo "正在初始化……"  
   read -p "正在初始化(不需要挂t)，是否继续？(y/n): " b
  if [ -z $b ];then
  $install
  $github
  fi
   if [ $b = 'y' ];then
  $install
  $github
   fi
   if [ $b = "n" ];then
   echo "\033[31m已取消\033[0m" 
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
  fi     
   
   if [ ! -f ~/python/sdat2img.py ];then
  echo "\033[31m$error\033[0m"
   rm -rf ~/python
   exit
   fi 

   read -p "请将product.new.dat和product.transfer.list文件放到工作目录/DAT文件夹里，按任意键继续" dat
   echo "\033[32m正在转为img…\033[0m"
   if [ ! -f $bf/工作目录/DAT/product.new.dat ];then
   echo "\033[31m转换img失败！，请确认product.new.dat是否已移动到工作目录/DAT里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi   
   python ~/python/sdat2img.py $bf/工作目录/DAT/product.transfer.list $bf/工作目录/DAT/product.new.dat $bf/工作目录/IMG/product.img   
   if [ ! -f $bf/工作目录/DAT/product.transfer.list ];then
   echo "\033[31m转换img失败！，请确认product.transfer.list是否已移动到工作目录/DAT里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
   echo "\033[32mimg已转换完成，生成到工作目录/IMG文件夹里。\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " vv
   if [ -z $vv ];then
   rm -rf $bf/工作目录/DAT/product.new.dat
   rm -rf $bf/工作目录/DAT/product.transfer.list   
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit       
   fi   
   if [ $vv = 'y' ];then
   rm -rf $bf/工作目录/DAT/product.new.dat
   rm -rf $bf/工作目录/DAT/product.transfer.list   
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit       
   fi
   if [ $vv = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
  fi
#3
   if [ $ven = '3' ];then
   if [ ! -d $bf/工作目录/IMG ];then
   mkdir $bf/工作目录/IMG
   fi
   if [ ! -d $bf/工作目录/DAT ];then
   mkdir $bf/工作目录/DAT
   fi   
   if [ ! -f ~/python/rimg2sdat.py ];then
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
   if [ ! -f ~/python/rimg2sdat.py ];then
  echo "\033[31m$error\033[0m"
   rm -rf ~/python
   exit
   fi  
   read -p "请将raw格式的product.img放到工作目录/IMG文件夹里，按任意键继续" img
   echo "\033[32m正在转为.dat…\033[0m"   
   if [ ! -f $bf/工作目录/IMG/product.img ];then
   echo "\033[31m转换dat失败！，请确认product.img是否为raw格式的和已移动到工作目录/IMG里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
   python ~/python/rimg2sdat.py $bf/工作目录/IMG/product.img -o $bf/工作目录/ -v 4
   if [ $? = '1' ];then
   echo "\033[33mdat转换失败！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
  mv $bf/工作目录/system.new.dat $bf/工作目录/DAT/product.new.dat
  mv $bf/工作目录/system.transfer.list $bf/工作目录/DAT/product.transfer.list   
  echo "\033[32mdat转换完成！\033[0m" 
   read -p "转换完成，是否删除旧文件？(y/n) " cc
   if [ -z $cc ];then 
   rm -rf $bf/工作目录/IMG/product.img
   read -p "已删除，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi    
   if [ $cc = 'y' ];then
   rm -rf $bf/工作目录/IMG/product.img
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit     
   fi
   if [ $cc = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
 fi  
#4
   if [ $ven = '4' ];then
   if [ ! -d $bf/工作目录/Br ];then
   mkdir $bf/工作目录/Br
   fi
   if [ ! -d $bf/工作目录/DAT ];then
   mkdir $bf/工作目录/DAT
   fi   
   read -p "请将product.new.dat放到工作目录/DAT文件夹里，按任意键继续" img
   echo "\033[32m正在转为.Br…\033[0m"   
   if [ ! -f $bf/工作目录/DAT/product.new.dat ];then
   echo "\033[31m转换br失败！，请确认product.new.dat是否已移动到工作目录/DAT里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
   read -p "请选择br的压缩级别（ 0-11 数字越大br体积越小，压缩时间更长，或者按回车使用默认等级压缩:0）: " ysdj
   if [ $ysdj ];then
   brotli -q $ysdj $bf/工作目录/DAT/product.new.dat -o $bf/工作目录/Br/product.new.dat.br
   else
   brotli -q 0 $bf/工作目录/DAT/product.new.dat -o $bf/工作目录/Br/product.new.dat.br
   fi
   if [ $? = '1' ];then
   echo "\033[31m转换br失败！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   mv $bf/工作目录/DAT/product.transfer.list   $bf/工作目录/Br
   echo "\033[32mbr转换完成！\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " cc
   if [ -z $cc ];then 
   rm -rf $bf/工作目录/DAT/product.new.dat
   read -p "已删除，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi    
   if [ $cc = 'y' ];then
   rm -rf $bf/工作目录/DAT/product.new.dat
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit     
   fi
   if [ $cc = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
 fi  
#5
if [ $ven = '5' ];then
   if [ ! -d $bf/工作目录/IMG ];then
   mkdir $bf/工作目录/IMG
   fi
   if [ ! -f ~/python/img2simg ];then
   rm -rf ~/python
   echo "正在初始化……"  
   read -p "正在初始化(不需要挂t)，是否继续？(y/n): " d
  if [ -z $d ];then
  $install
  $github
  fi
   if [ $d = 'y' ];then
  $install
  $github
   fi
   if [ $d = "n" ];then
   echo "\033[31m已取消\033[0m" 
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
  fi     
   
   if [ ! -f ~/python/img2simg ];then
  echo "\033[31m$error\033[0m"
   rm -rf ~/python
   exit
   fi
   chmod 0755 ~/python/img2simg
   read -p "请将raw格式的product.img放到工作目录/IMG文件夹里，按任意键继续" img
   echo "\033[32mrimg转为simg中…\033[0m"
   if [ ! -f $bf/工作目录/IMG/product.img ];then
   echo "\033[31m转换simg失败！，请确认product.img是否为raw格式的和已移动到工作目录/IMG里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   mv $bf/工作目录/IMG/product.img $bf/工作目录/IMG/product.rimg
   ~/python/img2simg $bf/工作目录/IMG/product.rimg $bf/工作目录/IMG/product.img
   echo "\033[32msimg已转换完成，生成到工作目录/IMG文件夹里。\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " nn
   if [ -z $nn ];then  
   rm -rf $bf/工作目录/IMG/product.rimg
   read -p "已删除，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit   
   fi    
   if [ $nn = 'y' ];then
   rm -rf $bf/工作目录/IMG/product.rimg
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit   
   fi
   if [ $nn = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
  fi
#6
if [ $ven = '6' ];then
   if [ ! -d $bf/工作目录/IMG ];then
   mkdir $bf/工作目录/IMG
   fi
   if [ ! -f ~/python/simg2img ];then
   rm -rf ~/python
   echo "正在初始化……"  
   read -p "正在初始化(不需要挂t)，是否继续？(y/n): " f
  if [ -z $f ];then
  $install
  $github
  fi
   if [ $f = 'y' ];then
  $install
  $github
   fi
   if [ $f = "n" ];then
   echo "\033[31m已取消\033[0m" 
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
  fi     
   if [ ! -f ~/python/simg2img ];then
  echo "\033[31m$error\033[0m"
   rm -rf ~/python
   exit
   fi
   if [ $os = 'Android' ];then   
   su -c chmod 0755 ~/python/simg2img
   fi
   if [ $os = 'GNU/Linux' ];then   
   chmod 0755 ~/python/simg2img
   fi 
   read -p "请将sparse格式的product.img放到工作目录/IMG文件夹里,按任意键继续" img
   echo "\033[32msimg转为rimg中…\033[0m"
   if [ ! -f $bf/工作目录/IMG/product.img ];then
   echo "\033[31m转换rimg失败！，请确认product.img是否为sparse格式的和已移动到工作目录/IMG中\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   mv $bf/工作目录/IMG/product.img $bf/工作目录/IMG/product.simg
   ~/python/simg2img $bf/工作目录/IMG/product.simg $bf/工作目录/IMG/product.img
   echo "\033[32mrimg已转换完成，生成到工作目录/IMG文件夹里。\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " qq
   if [ -z $qq ];then
   rm -rf $bf/工作目录/IMG/product.simg
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0 
   exit     
   fi   
   if [ $qq = 'y' ];then
   rm -rf $bf/工作目录/IMG/product.simg
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0 
   exit     
   fi
   if [ $qq = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0 
   exit  
   fi
  fi
#7
   if [ $ven = '7' ];then
   cd $af
   clear
   sh $mian
   fi