.PHONY: build run stop clean

# イメージ名とタグ
IMAGE_NAME := beginning-web
IMAGE_TAG := latest

# コンテナ名
CONTAINER_NAME := beginning-web

# ホストとコンテナのポートマッピング
HOST_PORT := 8443
CONTAINER_PORT := 443

# ホストとコンテナのディレクトリ同期
HOST_DIR := $(shell pwd)/app
CONTAINER_DIR := /var/www/html

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

run:
	docker run -itd --name $(CONTAINER_NAME) -p $(HOST_PORT):$(CONTAINER_PORT) -v $(HOST_DIR):$(CONTAINER_DIR) $(IMAGE_NAME):$(IMAGE_TAG)

stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)

clean:
	docker rmi $(IMAGE_NAME):$(IMAGE_TAG)