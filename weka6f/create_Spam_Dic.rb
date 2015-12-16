#Author:Yu Wenyan
#Date:2015-12-11
#Version:1.0
#功能:构建垃圾词汇库
#输入：垃圾短信库特征词集合S，正常短信库特征值集合N
#输出：Spam_Dic 垃圾词汇库


input_spamdic = File.open("D:/ruby/SMS-Spam-Classifier/weka6f/spamdic.txt")
input_normaldic = File.open("D:/ruby/SMS-Spam-Classifier/weka6f/normaldic.txt")
output = File.open("D:/ruby/SMS-Spam-Classifier/weka6f/Spam_Dic.txt","w")

spam = ""
normal = ""
outStr = ""

input_spamdic.each_line do |line|
  spam = spam + line
end

input_normaldic.each_line do |line|
  normal = normal + line
end

spam = spam.split(/,/)
spam.each do |word|
  if normal.include?(word)
    next
  end
  outStr = "#{outStr}#{word},"
end

outStr.chop!#破坏性的删除字符串最后一个字符
    
p spam
p outStr



output.write(outStr)#将生成的垃圾词汇库输出到文本文件中

input_spamdic.close
input_normaldic.close
output.close