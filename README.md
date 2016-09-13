# swift中的下拉刷新，原生适用于UITableviewController

####只要是通过对UIRefreshControl的创建和使用，对tableView加载刷新
######1、目前只对UITableviewController有用； 
######2、只能下拉刷新，不能上拉刷新； 
######3、init或者viewdidload中创建UIRefreshControl，设置文字，颜色等信息  
######4、系统自动管理UIRefreshControl，自动添加到tableview视图中
######5、给UIRefreshControl添加方法，当值改变的时候调用，方法用于数据请求
######6、该方法中请求数据确认完成之后，调用endRefreshing方法，关闭刷新；





## Contacts

####If you wish to contact me, email at: jinajunios@icloud.com

#####新浪微博 : [@windsSunShine](http://weibo.com/5789998869/)
#####博客园 : [@windsSunShine ](https://www.cnblogs.com/windsSunShine/)

## License
