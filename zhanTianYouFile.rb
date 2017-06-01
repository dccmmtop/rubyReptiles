require "yomu"
require "mechanize"
require "nokogiri"

def getContent(page,dir,io)
    puts dir
    dir =~ /第.+?届/
    title = $&
    dir =~ /[0-9][0-9][0-9][0-9]年度/
    title1=$&
    if title1==nil
        title1=""
    end

    title+=title1
    line=[]
    temp=""
    i=0
    page.xpath("//td[ @rowspan or not(@rowspan or @colspan) ]").each do |td|
        if td.content =~ /[0-9]$/ || !td.to_s.include?('x:str') || td.content =~ /序号|工程名称|参建单位|编号/
            next
        end
        if td.to_s.include?('rowspan')
            temp.slice!(-1)
            temp.gsub!(/[0-9]-/,"")
            i+=1
            if i>1
            io.puts(temp+","+title.to_s)
            puts "#{i}   #{temp},#{title.to_s}"
            end
            temp=""
            temp <<td.content+","
        else
            temp<<td.content+"、"
        end
    end
    temp.slice!(-1)
    temp.gsub!(/[0-9]-/,"")
    io.puts(temp+","+title.to_s)
    puts "#{i+1}   #{temp},#{title.to_s}"
end
i=0
io=File.open("./詹天佑奖.csv","w+")
io.puts("工程名称,参建单位,时间")
Dir.open("./詹天佑/詹天佑html/").each do |dir|
    if dir=="."||dir==".."
        next
    end
    f=File.open('./詹天佑/詹天佑html/'+dir)
    page=Nokogiri::HTML(f)
    i+=1
    getContent(page,dir,io)
    f.close
end
io.close

