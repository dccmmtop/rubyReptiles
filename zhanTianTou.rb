require "yomu"
require "mechanize"
require "open-uri"

$queue=[]
$queueFile=[]
$queue.push({"zhantianyou" => 'http://123.57.212.98/html/tm/29/38/68/68.html'})
while !$queue.empty?
    url=""
    $queue.shift.each_value do |value|
        url=value
    end
   begin
    page=Mechanize.new.get(url)
   rescue 
       puts "---------------------->>>>  #{url} 不能访问"
   end
   
    page.links.each do |link|
        if link.text.include?('.xls')
            puts link.text
            $queueFile.push({link.text => link.href})
        elsif link.text.include?('詹天佑奖获奖工程及获奖单位名单') || link.text.include?('下一页')
            #puts link.text
            $queue.push({link.text=>link.href})
        end
    end
end
#while !$queueFile.empty?
#    url=$queueFile.shift
#    url.each do |key,value|
#        puts key
#        File.open('./'+key,"w") do |io|
#            io.puts(open(value).read)
#        end
#    end
#end

