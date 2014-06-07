
library(httr)
library(httpuv)

# 1. Find OAuth settings for github:
# http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications
# Insert your values below - if secret is omitted, it will look it up in
# the GITHUB_CONSUMER_SECRET environmental variable.
#
# Use http://localhost:1410 as the callback url
myapp <- oauth_app("github","0b88679e13883a3d92b4", "be458af75289c079b7c75fc43c8373b57b2e0999")


# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
doc<-content(req)
x=data.frame(name=1:length(doc),time=1:length(doc))
for (i in 1:length(doc)){
  x$name[i]<-doc[[i]]$name
  x$time[i]<-doc[[i]]$created_at
  
}
x$time[x$name=="datasharing"]