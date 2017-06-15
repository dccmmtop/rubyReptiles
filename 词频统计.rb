def lcs(x,y)  # 最长公共子串
  return nil if x==nil || y==nil || x.strip==nil ||y.strip==nil

  ans=[]
  c=Array.new(x.size+1){Array.new(y.size+1) {|i| i="``"}}# ``比较特殊  用他来填充，，是为了用它来分割字符串
  (0...x.size).each do |i|
    (0...y.size).each do |j|
      if x[i].downcase==y[j].downcase
         # puts "#{x[i]}  #{j}"
         c[i][j]=x[i]
       end
     end
   end


   (0...y.size).each do |j|
    i=0
    k=j
    temp=""
    while k<y.size && i<x.size
      temp << c[i][k]
      k+=1
      i+=1
    end
    begin
      temp.split("``").each do |item|
       next if item==nil || item.size==0
       ans << item

     end
   rescue Exception => e

   end
 end
 (1...x.size).each do |i|
  j=0
  k=i
  temp=""
  while j<y.size && k<x.size
    temp << c[k][j]
    k+=1
    j+=1
  end


  begin
    temp.split("``").each do |item|
      next if item==nil || item.size==0
      ans << item
    end
  rescue Exception => e

  end
end
ans.sort{|a,b| b.size <=> a.size}
# 返回长度最长的
return ans[0]
end



def get_array(text)
  # 按标点符号分割文字
  text.gsub!(/\s/,",")
  # text.gsub!("　　",",")
  # text.strip!
  return text.split(/\p{P}/)
end

# 很有想法获取一个字符串在文本中出现的次数
def count_with(text,str)
  text.split(str).size-1

end

def pipei(text_array)
  word_hash=Hash.new
  i=0
  j=0
  text_array.each do |word_i|
    i+=1
    j=0
    text_array.each do |word_j|
      j+=1

      word= lcs(word_i,word_j)
      if word!=nil && word_hash[word]== nil && word.size>1
         # puts word
         word_hash[word]=1
       end
     end
   end
   word_hash
 end
 text=("如何降低激光雷达成本，“Trilumina”做了固态VCSEL照明模组

  Nicholas • 7小时前 • 公司新闻
  其研发的VCSEL照明模组是一种背面发光、倒片封装的固体垂直腔面发射激光器。
  如何降低激光雷达成本，“Trilumina”做了固态VCSEL照明模组
  此前我们报道过不少激光雷达企业，像国外的Velodyne，国内的禾赛科技、北科天绘、速腾聚创等等，这些企业都是做激光雷达整机的。而我近期接触的“Trilumina”则是从车用激光雷达的固态VCSEL照明模组开始做起。

  据Trilumina CEO黄百海介绍，现今的激光雷达主要是较为昂贵的机械式雷达，需要手工调教，其中，安装在车顶的激光器、传感器是其最昂贵的组件。而Trilumina提供的芯片为LiDAR提供了差异化的技术，6个体积小、低成本的激光雷达就可以环绕整车。

  Trilumina于2011年成立于美国，2013年获得第一笔风险投资。其研发的VCSEL照明模组是一种背面发光、倒片封装的固体垂直腔面发射激光器，已获批准或正在申请的专利有36个。黄百海告诉36氪，目前Trilumina在美国、亚洲和欧盟都有生产合作伙伴。

  上面提到，目前激光雷达的成本、体积和可靠性是阻碍其大规模应用的原因，而Trilumina对于LiDAR照明模组进行了重新设计，其可以使得激光雷达实现低成本、去除移动组件、提高可靠性，并扩大市场对激光雷达的采用率。

  如何降低激光雷达成本，“Trilumina”做了固态VCSEL照明模组

  具体来说，这种闪光激光雷达不需要光束控制，能同时照亮整个或部分的视野，并容易和其他技术共存，且对人眼安全。TriLumina为优化探测距离而研发了集成照明模组，实现了完全三维的固体激光雷达，低寄生电感使得3纳秒的脉宽成为可能，具有高峰值功率、并具备分区域能力和可扩展性。黄百海告诉36氪，Trilumina本身具有分段能力，可以分段闪光，即按顺序照明环境从而创建出一个三维的空间图，其采用了8线激光输出。

  在2017年的CES上，Trilumina展示了基于8线照明模组的256像素的三维激光雷达，这种模组可以用于分辨垂直方向上的物体；两个16元接收器阵列可以实现水平方向上的32区域的解析度。

  Trilumina的战略合，2017,作伙伴包括Denso、Caterpillar、Wafer Fabrication、LeddarTech、Analog Devices。

  Trilumina CEO黄百海曾是Enevate、D2Audio、Primarion的总裁兼CEO。目前，Trilumina正在寻求B轮融资。

  我是36氪汽车小组负责人卢姿伊，负责特斯拉、无人驾驶、新能源、车联网、出行及后市场，欢迎直接与我联系，微信：17701221940")
 word_array=get_array(text)
# puts word_array

word=pipei word_array
  # puts text
  array=[]
  word.each_key do |key|
    ci=count_with(text,key.to_s)
    array << [key.to_s , ci]
  end
  array= array.sort do |a,b|
    if a[0].size!=b[0].size
      a[0].size <=>  b[0].size
    else 
      b[1] <=> a[1]

    end 
  end  
  array.each do |item|
    puts "#{item[0]}   #{item[1]}"
  end

# p lcs("Trilumina","tril")









