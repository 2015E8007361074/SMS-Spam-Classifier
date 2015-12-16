#Author:Yu Wenyan
#Date:2015-12-10
#Version:1.0
#Function:generating feature vector for test data

#format
#input:data_test.txt
#output:result_test.txt
#SMSLen,SPNum,PhoneNum,Banknum,URL,Outcome
#60,1,1,1,1,yes
#20,0,0,0,0,no

#Time Start

tStart = Time.now
puts "Time Start:#{tStart}"

#Read SMS data each line

input = "D:/ruby/SMS-Spam-Classifier/weka/result_test_200000.txt"
output = "D:/ruby/SMS-Spam-Classifier/weka/finalSubmit.txt"

file_input = File.open(input)
file_output = File.open(output,"w")

outStr = ""

#Deal with each line 
file_input.each_line do |line|
   #initial features
   smsLen,spNum,phoneNum,bankNum,url,outcome = 60,0,0,0,0,"no"
  
   sLine = line.split(/\t/)
   smsLen = sLine[1].length 
   spNum = 1 if sLine[1].include?("xxxxxxx")
   phoneNum = 1 if sLine[1].include?("xxxxxxxxxxx")
   bankNum = 1 if sLine[1].include?("xxxxxxxxxxxxxxxxxxx")
   url = 1 if sLine[1] =~ /((https?|ftp|news):\/\/)?([a-z]([a-z0-9\-]*[\.。])+([a-z]{2}|aero|arpa|biz|com|coop|edu|gov|info|int|jobs|mil|museum|name|nato|net|org|pro|travel)|(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))(\/[a-z0-9_\-\.~]+)*(\/([a-z0-9_\-\.]*)(\?[a-z0-9+_\-\.%=&]*)?)?(#[a-z][a-z0-9_]*)?/
   
   outcome = "no"  
     
   outStr.concat("#{smsLen},#{spNum},#{phoneNum},#{bankNum},#{url},#{outcome}\n")
   
end

file_output.write(outStr)

file_input.close
file_output.close

#Time End

tEnd = Time.now
tConsume = tEnd - tStart
puts "Time End:#{tEnd}"
puts "Time Consuming:#{tConsume}"
