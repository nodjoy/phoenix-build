FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
LABEL maintainer="gowshwah<nodjoy@163.com>"
LABEL version="1.1.0"
LABEL description="phoenix framework build image"

RUN sed -i "s@http://.*archive.ubuntu.com@http://mirrors.huaweicloud.com@g" /etc/apt/sources.list \
    && sed -i "s@http://.*security.ubuntu.com@http://mirrors.huaweicloud.com@g" /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y make gcc g++ erlang elixir curl wget \
    # && mix local.hex --force \
    && wget https://hexpm.upyun.com/installs/1.12.0/hex-2.0.6.ez && mix archive.install ./hex-2.0.6.ez --force \
    && mix hex.config mirror_url https://hexpm.upyun.com \
    # && mix local.rebar --force \
    && wget https://hexpm.upyun.com/installs/1.0.0/rebar-2.6.2 && mix local.rebar rebar ./rebar-2.6.2 --force \
    && wget https://mirror.ghproxy.com/github.com/erlang/rebar3/releases/download/3.15.2/rebar3 && chmod +x rebar3 && mv rebar3 /root/.mix \
    && mix archive.install hex phx_new 1.6.15 --force \
    && apt-get install -y unzip git vim net-tools inotify-tools \
    # && apt-get install -y nodejs npm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

WORKDIR /app

COPY build.sh /app

# 在容器启动时执行build.sh脚本
CMD ["/bin/bash", "/app/build.sh"]

# docker run -it -v $(pwd)/your-path:/app/phoenix --rm nodjoy/phoenix-build:latest