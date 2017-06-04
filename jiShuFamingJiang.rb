require "nokogiri"
require "mechanize"

path='/home/dengchao/桌面/jiang/'

def getFile(path)
    file=[]
    Dir.open(path).each do|item|
        # 本程序也可以匹配技术发明奖
        if item.to_s.include?("技术进步奖")
            file << path+item.to_s
        end
    end
    return file
end

def getContent(file,io)
    # 浏览器打开本地html的格式，在浏览器里面打开一遍就知道了
        page=Mechanize.new.get("file://"+file)
    file =~ /....年度/
    time=$&
        
  # page=Mechanize.new.get("file:///home/dengchao/%E6%A1%8C%E9%9D%A2/jiang/2004%E5%B9%B4%E5%BA%A6%E5%9B%BD%E5%AE%B6%E7%A7%91%E5%AD%A6%E6%8A%80%E6%9C%AF%E8%BF%9B%E6%AD%A5%E5%A5%96%E7%9B%AE%E5%BD%95(2006-01-05).html")
 

   page.encoding="gbk"
 # puts page.body
    jiangXiang=""
   
page.xpath("//table/tbody/tr|//table/thead/tr | //*[contains(text(),'等 奖') or contains(text(),'等奖')]").each do |tr|
   # page.xpath("//table/tr").each do |tr|
        line =tr.content
      # puts tr.content
        temp=""
        if line=~ /序号|项目名称|推荐单位/
            next
        end
        if line.include?('等奖')||line.include?('等 奖')
            jiangXiang=line
            next
        end
        tr.xpath("td").each do |td|
          # 注意： 下面的的语句如果改成   td.content.gsub！(/\s+?/,"")  会出现错误，，，返回值为空
            temp << td.content.gsub(/\s+?/,"")+","
        end
        lineTemp="#{temp}#{jiangXiang},#{time}"
        #puts lineTemp.count(',')
        if lineTemp.count(',')==6
            lineTemp[0,0]=','
        end
       puts lineTemp
      # io.puts(lineTemp)
       

    end

end
io=File.open("./jinBu.csv","w+")
   # getContent("1234",io)
getFile(path).each do |file|
   puts file
getContent(file,io)


end
io.close

