#Buổi 6:

#- Đọc ghi ngôn ngữ Perl 
#- Có thể dùng perl online (hoặc sách perl 21 ngày)
#- Lưu ý là không được để warning

#example:

use strict;	#// tạo error và warning
use warnings;

open(FILECFG, "<config") or die("Error cannot open file"); 	#open file to read
# open(FILEOUT, ">result") or die("Error cannot open file"); 	#open file to read

my $line;   # từ khóa khai báo biến là "my"
my $linetmp;
my $countline = -1;
my @record;

foreach $line (<FILECFG>) {	#đọc 1 dòng trong file
    $countline++;
    next if ($countline == 0);
    @record = split(/\s+/,$line);		#s+ nghĩa là nhiều khoảng trắng
    open(FILETMP, "<template") or die("Error cannot open file"); 	#open file to read
    open(FILEOUT, ">Result_$countline") or die("Error cannot open file"); 	#open file to read
	foreach $linetmp (<FILETMP>) {
		$linetmp =~ s/<name>/$record[1]/g;
		$linetmp =~ s/<age>/$record[2]/g;
		print FILEOUT ($linetmp);
	}
	close(FILEOUT);
	close(FILETMP);
	
	# print FILEOUT ($line); 	# chỉ cần thêm FILEOUT
}

# print FILEOUT(\nCompleted!);

# Tuy nhiên nếu như in lại thì sẽ không được, do các dòng biến mất trong handler của file rồi
# foreach $line <FILEIN>{	#đọc 1 dòng trong file
#	print($line);
# }
#
# lúc đi làm thì phải test hết các thanh ghi trong 1 lệnh asm add $<des>, $<s1>, $<s2>;
close(FILECFG);