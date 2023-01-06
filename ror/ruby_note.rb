# ""  可以使用特殊字元 可以加入運算式

"tow#{1+1}tow"

# 正規表示 兩種寫法 / 包住 /    %r



陣列 三種寫法 []    %w    %W 則可以包含運算式

[1,2,3]
%w(1 2 3)  以空白為分隔 多個空白視為一個  預設為字串
%W(1 2 #{12*3})   預設為字串



雜湊
h = {"a" => "b", "c" => "b"}

啟動指令 `echo Ruby`

否定

!
not
~  位元反轉


1..10 範圍運算子 1 到 10

ar = 1..10
ar.each do |ee|
    puts ee
end



== 值等於
!= 值不等於

=~ 正規
!~ 正規否定


=== case 敘述中的同值判斷

?: 條件運算

condition1? 運算1 : 運算2

a = 3

a>2? a+1 : a-1



變數

區域變數  _a
實體變數  @a  僅屬於某個特定物件 僅能由該物件中的方法存取
類別變數  @@a 屬於特定類別 可由該類別/子類別/實體來存取
全域變數  $a
常數     大寫開頭 Cons


多行註解

=begin
註解
rescue Exception => e
註解
=end




條件判斷 if 條件真就做 unless 條件假就做 case

if cc1 then
    a + 1
elsif cc2
    a + 2
else
    a + 3
end
#######

unless a > 4 then
    b = 3
end
#######

a = 1

begin
    a = 4
end if a < 3

begin
    a = 2
end unless a < 3
#######


grade = 78

case grade
when 80..100
    puts "great"
when 60..79
    puts "good"
else
    puts "bad"
end
#######


迴圈判斷  while 若真則做直到假結束     until 若假則做直到真結束 for

while xx do
    xxx
end

until xx do
    xxx
end


for i in a do
    xxxx
end
########

begin
    xxx
end while xxx

begin
    xxx
end until xxx
########
