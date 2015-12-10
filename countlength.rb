require "pp"
#计时开始
t1 = Time.now
p t1


input = "D:/ruby/SMS-Spam-Classifier/data/data_train.txt"
file_input = File.open(input)

spamsms_wc = 0
spamsms_al = 0
spamsms_maxl = 0
spamsms_minl = 100

normal_wc = 0
normal_al = 0
normal_maxl = 0
normal_minl = 0

n1 = 0
n2 = 0

max_matches = 8000 #print out the max line
matches = 0
str = ""

file_input.each_line do |line|
  
  if matches >= max_matches
     break     
  end 
    
  sline = line.split(/\t/)
  
  if sline[1] == "1"
    spamsms_wc += 1
    spamsms_al += sline[2].length
    
  if sline[2].length > spamsms_maxl     
    spamsms_maxl = sline[2].length
    n1 = sline[0] 
  end
  if sline[2].length < spamsms_minl 
    spamsms_minl = sline[2].length 
    n2 = sline[0]
   end     
  end
end
file_input.close

p "垃圾短信的个数：#{spamsms_wc}"
p "垃圾短信的平均长度：#{spamsms_al/spamsms_wc}"
p "最大垃圾短信长度：#{spamsms_maxl}序号：#{n1}"
p "最小垃圾短信长度：#{spamsms_minl}序号:#{n2}"

#计时结束
t2 = Time.now
p t2

puts "总共耗时：#{t2 - t1}s"