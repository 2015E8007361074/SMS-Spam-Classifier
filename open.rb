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
  num = (sline[1].length > 60)?1:0   
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