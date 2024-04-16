FROM ubuntu:latest

RUN apt update && apt install -y nginx ssh

RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 80 22

CMD service ssh start && nginx -g "daemon off;"
