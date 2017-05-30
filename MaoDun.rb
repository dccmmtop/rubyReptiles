=begin
完成对百度百科矛盾文学奖名单的提取，
知识点:
1, mechanize 包的使用
2，xpath匹配网页的元素
3，ruby正则表达式的用法

尚未完成的功能有（难点）：
1. 没有过滤div下的一些图片


=end



require "mechanize"
class MaoDun
    def getTime(line)
        temp=""
        line=~/第.届/
        temp=$&
        line =~ /（[0-9]{1,4}—[0-9]{1,4}）/
        temp1=$&
        return temp+temp1
    end
    
    def getPage(url)    
        page=Mechanize.new.get(url);
        # 改变编码方式，若没有改变编码方式，可能会到时网页提取不完
        page.encoding="gdk"
        return page    
    end
    
    def  getContent(page)
        # div[position()]  div的位置
        return  page.xpath(" //div[position()>53 and position()<107 ]")
    end
    
end

maoDun=MaoDun.new
page=maoDun.getPage('http://baike.baidu.com/item/%E8%8C%85%E7%9B%BE%E6%96%87%E5%AD%A6%E5%A5%96#6');
time=""
maoDun.getContent(page).each do |item|
  line=item.content.strip
    
  if line.include?("茅盾文学奖获奖篇目")
      time= maoDun.getTime(line)
  else
       if  line.include?("，")
           line.gsub!("，",",")
           puts "#{line},#{time}"
       end
  end
  
    
    
end



