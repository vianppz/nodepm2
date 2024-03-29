# 基于最新版的NODE容器创建
FROM node:latest
MAINTAINER waterchestnut "zw@zhaoyun.pro"

# 安装pm2的插件webshell，方便在容器外直接管理node和pm2
RUN npm install -g pm2@latest
RUN pm2 install pm2-webshell
RUN pm2 conf pm2-webshell:username waterchestnut
RUN pm2 conf pm2-webshell:password waterchestnut

# 映射nodejs可执行文件的目录
VOLUME ["/app"]
# 复制容器的执行脚本
COPY start /start
RUN chmod 755 /start
# 容器的执行命令
CMD ["/start"]

# 暴露端口映射
EXPOSE 80
EXPOSE 443