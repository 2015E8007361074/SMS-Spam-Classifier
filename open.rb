#计时开始
t1 = Time.now
p t1


input = "D:/ruby/SMS-Spam-Classifier/data/test_data_20w.txt"
output = "D:/ruby/SMS-Spam-Classifier/data/result.txt"

file_input = File.open(input)
file_output = File.open(output,"w")

max_matches = 200000 #print out the max line
matches = 0
str = ""

file_input.each_line do |line|
  
  if matches >= max_matches
     break     
  end 
    
  sline = line.split(/\t/)
#  num = (sline[1].length > 65)?1:0
   if sline[1].length > 65
     num = 1
   elsif sline[1] =~ /xxxxxx+/
     num = 1
   elsif sline[1] =~ /www/
     num = 1
   elsif sline[1] =~ /【.*】/
     num = 1
   elsif sline[1] =~ /！/
     num = 1
   elsif sline[1] =~ /您好/
     num = 1
   elsif sline[1] =~ /欢迎您/
     num = 1
   elsif sline[1] =~ /↓/
     num = 1
   else
     num = 0
   end
     
  str = str+"#{sline[0]},#{num}\n"     
  matches += 1
end

file_output.write(str)

file_output.close
file_input.close

#计时结束
t2 = Time.now
p t2

puts "总共耗时：#{t2 - t1}s"