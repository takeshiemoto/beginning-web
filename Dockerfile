FROM ubuntu:latest

# 必要なパッケージのインストール
RUN apt update && apt install -y nginx openssl wget

# nginxの設定ファイルを追加
RUN echo 'server {\n\
    listen 443 ssl;\n\
    server_name localhost;\n\
    ssl_certificate /etc/nginx/ssl/server.crt;\n\
    ssl_certificate_key /etc/nginx/ssl/server.key;\n\
    location / {\n\
        root /var/www/html;\n\
        index index.html;\n\
    }\n\
}' > /etc/nginx/conf.d/default.conf

# SSL証明書の生成
RUN mkdir /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt -subj "/CN=localhost"

# HTMLファイルの配置
#RUN echo '<html><body><h1>Hello world!</h1></body></html>' > /var/www/html/index.html

# ポート443を公開
EXPOSE 443

# コンテナ起動時にnginxを起動
CMD ["nginx", "-g", "daemon off;"]
