library(Rweibo)
registerApp("2421883508", "dfdb7ae94e11f6e59e37afc4be83f814", app_name = "rchiffon")  

# ��R��ע���µ�Ӧ��
roauth <- createOAuth("rchiffon", "��ŶŶchiffon")  

# ����OAuth����
timeline.Friends(roauth, list(count = 5))  

# ��ȡ���Ѽ��Լ���ǰ5������΢��
timeline.CommentsList(roauth, list(id = 14762313082))  

# ��ȡĳ��΢���������б�
timeline.Comments(roauth, list(count = 5))  

# ��ȡ�Լ����ͼ��յ�������
timeline.Repost(roauth, list(id = 14761105585, count = 5))  

# ��ȡĳID΢����ת�����
timeline.Mentions(roauth, list(count = 5))  

# ��ȡ@�˵�ǰ�û���΢���б�
timeline.User(roauth, list(screen_name = "rweibo", count = 5))  

# ��ȡĳ�û�����Ϣ
access.update(roauth, list(status = "hello world"))  

# ��һ��΢��
search.Content(roauth, list(q = "Rweibo"))  
# ���ݹؼ�������΢������