require "pp"
#Time Start

tStart = Time.now
puts "Time Start:#{tStart}"
input = File.open("D:/ruby/SMS-Spam-Classifier/ccf/test_data_20w_cut.txt")
output = File.open("D:/ruby/SMS-Spam-Classifier/ccf/test_data_20w_cut_predeal.txt","w")

#对进行中文分词后的短信样本数据进行预处理
count = 0
sline = ""
input.each_line do |line|  
  #break if count >= 10
  line = line.gsub(/\t/,"") #删除文本中的制表符
  line = line.gsub(/\s+/,"") #删除文本中所有的空格
  puts line
  sline = "#{sline}#{line}\n"
  count += 1
end

puts sline
output.write(sline)
input.close
output.close

#Time End

tEnd = Time.now
tConsume = tEnd - tStart
puts "Time End:#{tEnd}"
puts "Time Consuming:#{tConsume}"
