#转换system
   echo "\033[32m转换system：\033[0m"
   echo "1.br转dat
2.dat转img
3.img转dat
4.dat转br
5.raw转sparse
6.sparse转raw
7.返回"
   read -p "请选择: " sys
  if [ -z $sys ];then
  clear  
  sh $0
  exit
  fi   
#1
   if [ $sys = '1' ];then  
   if [ ! -d $bf/工作目录/Br ];then
   mkdir $bf/工作目录/Br
   fi
   if [ ! -d $bf/工作目录/DAT ];then
   mkdir $bf/工作目录/DAT
   fi
   if [ ! -f $bf/工作目录/Br/system.transfer.list ];then
   .
   else
   mv $bf/工作目录/Br/system.transfer.list  $bf/工作目录/DAT
   fi   
   read -p "请将system.new.dat.br文件放到工作目录/Br文件夹里，按任意键继续" br
   echo "\033[32m正在转为dat…\033[0m"
   if [ ! -f $bf/工作目录/Br/system.new.dat.br ];then
   echo "\033[31m转换dat失败！，请确认system.new.dat.br文件是否已移动到工作目录/Br里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   brotli -d $bf/工作目录/Br/system.new.dat.br -o $bf/工作目录/DAT/system.new.dat
   echo "\033[32mdat已转换完成，生成到工作目录/DAT文件夹里。\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " zz
   if [ -z $zz ];then
   rm -rf $bf/工作目录/Br/system.new.dat.br
   read -p "已删除，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit   
   fi   
   if [ $zz = 'y' ];then
   rm -rf $bf/工作目录/Br/system.new.dat.br
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit         
   fi
   if [ $zz = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
  fi
#2
if [ $sys = '2' ];then
   if [ ! -d $bf/工作目录/DAT ];then
   mkdir $bf/工作目录/DAT
   fi
   if [ ! -d $bf/工作目录/IMG ];then
   mkdir $bf/工作目录/IMG
   fi
   if [ ! -f ~/python/sdat2img.py ];then
   rm -rf ~/python
   echo "正在初始化……"  
   read -p "正在初始化(不需要挂t)，是否继续？(y/n): " a
   if [ -z $a ];then
  $install
  $github
   fi   
   if [ $a = 'y' ];then
  $install
  $github
   fi
   if [ $a = "n" ];then
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
   read -p "请将system.new.dat和system.transfer.list文件放到工作目录/DAT文件夹里，按任意键继续" dat
   echo "\033[32m正在转为img…\033[0m"
   if [ ! -f $bf/工作目录/DAT/system.new.dat ];then
   echo "\033[31m转换img失败！，请确认system.new.dat是否已移动到工作目录/DAT里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi   
   python ~/python/sdat2img.py $bf/工作目录/DAT/system.transfer.list $bf/工作目录/DAT/system.new.dat $bf/工作目录/IMG/system.img
   if [ ! -f $bf/工作目录/DAT/system.transfer.list ];then
   echo "\033[31m转换img失败！，请确认system.transfer.list是否已移动到工作目录/DAT里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi      
   echo "\033[32mimg已转换完成，生成到工作目录/IMG文件夹里。\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " cc
   if [ -z $cc ];then 
   rm -rf $bf/工作目录/DAT/system.new.dat
   rm -rf $bf/工作目录/DAT/system.transfer.list 
   read -p "已删除，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi    
   if [ $cc = 'y' ];then
   rm -rf $bf/工作目录/DAT/system.new.dat
   rm -rf $bf/工作目录/DAT/system.transfer.list 
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
#3
   if [ $sys = '3' ];then
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
   read -p "请将raw格式的system.img放到工作目录/IMG文件夹里，按任意键继续" img
   echo "\033[32m正在转为.dat…\033[0m"   
   if [ ! -f $bf/工作目录/IMG/system.img ];then
   echo "\033[31m转换dat失败！，请确认system.img是否为raw格式的和已移动到工作目录/IMG里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
   python ~/python/rimg2sdat.py $bf/工作目录/IMG/system.img -o $bf/工作目录/DAT -v 4
   if [ $? = '1' ];then
   echo "\033[33mdat转换失败！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
  echo "\033[32mdat转换完成！\033[0m" 
   read -p "转换完成，是否删除旧文件？(y/n) " cc
   if [ -z $cc ];then 
   rm -rf $bf/工作目录/IMG/system.img
   read -p "已删除，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi    
   if [ $cc = 'y' ];then
   rm -rf $bf/工作目录/IMG/system.img
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
   if [ $sys = '4' ];then
   if [ ! -d $bf/工作目录/Br ];then
   mkdir $bf/工作目录/Br
   fi
   if [ ! -d $bf/工作目录/DAT ];then
   mkdir $bf/工作目录/DAT
   fi   
   read -p "请将system.new.dat放到工作目录/DAT文件夹里，按任意键继续" img
   echo "\033[32m正在转为.Br…\033[0m"   
   if [ ! -f $bf/工作目录/DAT/system.new.dat ];then
   echo "\033[31m转换br失败！，请确认system.new.dat是否已移动到工作目录/DAT里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit
   fi
   read -p "请选择br的压缩级别（ 0-11 数字越大br体积越小，压缩时间更长，或者按回车使用默认等级压缩:0）: " ysdj
   if [ $ysdj ];then
   brotli -q $ysdj $bf/工作目录/DAT/system.new.dat -o $bf/工作目录/Br/system.new.dat.br
   else
   brotli -q 0 $bf/工作目录/DAT/system.new.dat -o $bf/工作目录/Br/system.new.dat.br
   fi
   if [ $? = '1' ];then
   echo "\033[31m转换br失败！\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi
   mv $bf/工作目录/DAT/system.transfer.list  $bf/工作目录/Br
   echo "\033[32mbr转换完成！\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " cc
   if [ -z $cc ];then 
   rm -rf $bf/工作目录/DAT/system.new.dat
   read -p "已删除，按任意键返回" make
   cd $af
   clear
   sh $0   
   exit
   fi    
   if [ $cc = 'y' ];then
   rm -rf $bf/工作目录/DAT/system.new.dat
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
if [ $sys = '5' ];then
   if [ ! -d $bf/工作目录/IMG ];then
   mkdir $bf/工作目录/IMG
   fi
   if [ ! -f ~/python/img2simg ];then
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
   if [ ! -f ~/python/img2simg ];then
  echo "\033[31m$error\033[0m"
   rm -rf ~/python
   exit
   fi
   chmod 0755 ~/python/img2simg
   read -p "请将raw格式的system.img放到工作目录/IMG文件夹里，按任意键继续" img
   echo "\033[32mrimg转为simg中…\033[0m"
   if [ ! -f $bf/工作目录/IMG/system.img ];then
   echo "\033[31m转换simg失败！，请确认system.img是否为raw格式的和已移动到工作目录/IMG里\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
   mv $bf/工作目录/IMG/system.img $bf/工作目录/IMG/system.rimg
   ~/python/img2simg $bf/工作目录/IMG/system.rimg $bf/工作目录/IMG/system.img
   echo "\033[32msimg已转换完成，生成到工作目录/IMG文件夹里。\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " bb
   if [ -z $bb ];then
   rm -rf $bf/工作目录/IMG/system.rimg
   read -p "已删除，按任意键返回" make
   cd $af
   clear
   sh $0  
   exit    
   fi   
   if [ $bb = 'y' ];then
   rm -rf $bf/工作目录/IMG/system.rimg
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit    
   fi
   if [ $bb = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
  fi
#6
if [ $sys = '6' ];then
   if [ ! -d $bf/工作目录/IMG ];then
   mkdir $bf/工作目录/IMG
   fi
   if [ ! -f ~/python/simg2img ];then
   rm -rf ~/python
   echo "正在初始化……"  
   read -p "正在初始化(不需要挂t)，是否继续？(y/n): " e
   if [ -z $e ];then
  $install
  $github
   fi
   if [ $e = 'y' ];then
  $install
  $github
   fi
   if [ $e = "n" ];then
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
   read -p "请将sparse格式的system.img放到工作目录/IMG文件夹里,按任意键继续" img
   echo "\033[32msimg转为rimg中…\033[0m"
   if [ ! -f $bf/工作目录/IMG/system.img ];then
   echo "\033[31m转换rimg失败！，请确认system.img是否为sparse格式的和已移动到工作目录/IMG中\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
   mv $bf/工作目录/IMG/system.img $bf/工作目录/IMG/system.simg
   ~/python/simg2img $bf/工作目录/IMG/system.simg $bf/工作目录/IMG/system.img
   echo "\033[32mrimg已转换完成，生成到工作目录/IMG文件夹里。\033[0m"
   read -p "转换完成，是否删除旧文件？(y/n) " mm
   if [ -z $mm ];then
   rm -rf $bf/工作目录/IMG/system.simg
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi      
   if [ $mm = 'y' ];then
   rm -rf $bf/工作目录/IMG/system.simg
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi   
   if [ $mm = 'n' ];then
   echo "\033[32m不删除\033[0m"
   read -p "按任意键返回" make
   cd $af
   clear
   sh $0  
   exit 
   fi
 fi
#7
   if [ $sys = '7' ];then
   cd $af
   clear
   sh $mian
   fi