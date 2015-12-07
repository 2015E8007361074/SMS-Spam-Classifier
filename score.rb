require "pp"
#计时开始
t1 = Time.now
p t1

input1 = "D:/ruby/SMS-Spam-Classifier/data/data_result.txt"
input2 = "D:/ruby/SMS-Spam-Classifier/data/data_result_predict.txt"
input3 = "D:/ruby/SMS-Spam-Classifier/data/data_test.txt"
output = "D:/ruby/SMS-Spam-Classifier/data/incorrect.txt"

file_input1 = File.open(input1)
file_input2 = File.open(input2)
file_input3 = File.open(input3)
file_output = File.open(output,"w")
#########################################################################
max_matches = 2000 #统计数据总量~
matches = 0
str = ""
incorrect = ""

file_input1.each_line do |line|
  
  if matches >= max_matches
     break     
  end
    line.chomp!   #破坏性的chomp!方法直接删除换行符   
    sline = line.split(/,/)
    str = str + "#{sline[1]}"
    matches += 1    
end
#puts str  #输出str
#pp str
#########################################################################
matches = 0
correct_num=0

file_input2.each_line do |line|
  
  if matches >= max_matches
    break
  end
  line.chomp!
  sline = line.split(/,/)
  if sline[1] == str[matches]
    correct_num += 1
  else
    incorrect = incorrect + sline[0] + "\n"
  end  
  matches += 1  
end
#########################################################################
#puts incorrect
puts "将分错短信序号，写入incorrect,txt文件中..."
file_output.write(incorrect)

file_input3.each_line do |line|
  sline = line.split(/\t/)
  if incorrect.include?(sline[0])
    puts sline[1]
  end
  
end




#puts "最后准确率为：#{(correct_num/max_matches).to_f}"
puts
puts "分类正确的：#{correct_num}"
puts "总的数据集：#{max_matches}"

score = (correct_num.to_f / max_matches.to_f)


puts "最后得分：#{score}"

puts
file_output.close
file_input3.close
file_input2.close
file_input1.close

#计时结束
t2 = Time.now
p t2

puts "时间耗费：#{t2 - t1}s"