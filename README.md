### 长江学者 是个最初级的ruby爬虫事例，里面主要用到了一下知识点
* Nokogiri包的使用
* mechanize 包的使用
* xpath匹配html节点的方法
* 字符串的一些简单操作

### MaoDun.rb  在百度百科中提取矛盾文学奖的名单
* 完成对百度百科矛盾文学奖名单的提取，
  * 知识点:
    * 1, mechanize 包的使用
    * 2，xpath匹配网页的元素
    * 3，ruby正则表达式的用法

* 尚未完成的功能有（难点）：
  * 1. 没有过滤div下的一些图片

### zhanTianYou.rb  从网站获取所有excel文件到本地，（爬取网站信息）

* 根据一个入口如url获得所有的url，并进行跳转。
* 下载文件

### zhanTianYouFile.rb 将excel文件转换为html文件，并提取信息保存csv文件。
### jiShufaming.rb  爬取国家技术部发明奖与技术进步奖
* xpath  contains 的用法。

### 词频统计
* 利用最长公共子串算法，来找出一篇文章中出现次数最多的那个词
* 思路  ： 先奖一篇文章按照标点符号来分割成字符串，再将这些字符串两求出最长公共子串，将次公共子串保存下来。然后在文章中找这个子串一共出现了多少次


