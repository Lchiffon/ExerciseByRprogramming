library(Rweibo)
registerApp("2421883508", "dfdb7ae94e11f6e59e37afc4be83f814", app_name = "rchiffon")  

# 在R中注册新的应用
roauth <- createOAuth("rchiffon", "啊哦哦chiffon")  

# 创建OAuth对象
timeline.Friends(roauth, list(count = 5))  

# 获取好友及自己的前5条最新微博
timeline.CommentsList(roauth, list(id = 14762313082))  

# 获取某条微博的评论列表
timeline.Comments(roauth, list(count = 5))  

# 获取自己发送及收到的评论
timeline.Repost(roauth, list(id = 14761105585, count = 5))  

# 获取某ID微博的转发情况
timeline.Mentions(roauth, list(count = 5))  

# 获取@了当前用户的微博列表
timeline.User(roauth, list(screen_name = "rweibo", count = 5))  

# 获取某用户的信息
access.update(roauth, list(status = "hello world"))  

# 发一条微博
search.Content(roauth, list(q = "Rweibo"))  
# 根据关键词搜索微博内容