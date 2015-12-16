#Author:Yu Wenyan
#Date:2015-12-11
#Version:1.0
#Function:generating feature vector

#format
#input:test_data_20w_cut_predeal.txt
#output:feature_Vector.txt
#SMSLen,SPNum,PhoneNum,Banknum,URL,SpamWord,Outcome
#60,1,1,1,1,2,yes
#20,0,0,0,0,0,no

require "pp"
#Time Start

tStart = Time.now
puts "Time Start:#{tStart}"
#垃圾词汇库
SpamDic = "xxxxxxxxxxx,您好,优惠,欢迎,xxxxxxx,全场,地址,祝您,顾客,xxxxx,xxxxxxxx,电话,致电,报名,赠送,免费,光临,女人,回馈,本店,推出,会员,专柜,咨询,元宵节, 新年好,特价,礼品,热线,联系,感谢您,尊敬,三八,欢迎您,三八节,进店,享受,原价,快乐,亲爱,新老,来电,客户,红包,xxxxxx,专业,三八妇女节,优惠活动,春装,即可,xxxxxxxxxxxxxxxxxxx,你好,特惠,美丽,购买,选购,装饰,现金,各位,前来,新款,老客户,妇 女节,抢购,三月,期待,详询,辅导,好消息,元宵,家长,惊喜,当天,买一送一,产品,亲们,品牌,销售,咨询电话,精美,有限公司,朋友,话费,感谢,低至,多多,体验,养生, 开课,需要"
input = File.open("D:/ruby/SMS-Spam-Classifier/ccf/test_data_20w_cut_predeal.txt")
output = File.open("D:/ruby/SMS-Spam-Classifier/ccf/feature_Vector.txt","w")

outStr = ""
#对每天短信进行与垃圾词库匹配操作，获取其含垃圾词汇的个数
def getSpamWord line
  spamWord = 0
  sssline = line.split(/\//)
  
  sssline.each do |word|
    spamWord += 1 if SpamDic.include?(word)
  end
  return spamWord
end

#对预处理后的进行特征属性的提取
count = 0

input.each do |line|
  
  #break if count > 10
  #初始化特征属性
  smsLen,spNum,phoneNum,bankNum,url,spamWord,outcome = 60,0,0,0,0,0,"no"
    
  ssline = line.split(/\//)
     smsLen = line.length 
     spNum = 1 if line.include?("xxxxxxx")
     phoneNum = 1 if line.include?("xxxxxxxxxxx")
     bankNum = 1 if line.include?("xxxxxxxxxxxxxxxxxxx")
     url = 1 if line=~ /((https?|ftp|news):\/\/)?([a-z]([a-z0-9\-]*[\.。])+([a-z]{2}|aero|arpa|biz|com|coop|edu|gov|info|int|jobs|mil|museum|name|nato|net|org|pro|travel)|(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))(\/[a-z0-9_\-\.~]+)*(\/([a-z0-9_\-\.]*)(\?[a-z0-9+_\-\.%=&]*)?)?(#[a-z][a-z0-9_]*)?/
     spamWord = getSpamWord(line)
     outcome = "no"
       
     outStr.concat("#{smsLen},#{spNum},#{phoneNum},#{bankNum},#{url},#{spamWord},#{outcome}\n")
     count += 1
end 

puts outStr

output.write(outStr)
input.close
output.close

#Time End

tEnd = Time.now
tConsume = tEnd - tStart
puts "Time End:#{tEnd}"
puts "Time Consuming:#{tConsume}"
