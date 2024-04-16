image_name = beginning-web
container_name = beginning-web

# dockerイメージのビルド
build:
	docker build -t $(image_name) .

# dockerコンテナの起動（初回）
run: build
	docker run -d --name $(container_name) -p 80:80 $(image_name)

# dockerコンテナの起動（2回目以降）
start:
	docker start $(container_name)

# dockerコンテナの停止
stop:
	docker stop $(container_name)

# dockerコンテナ・イメージ・ボリュームの完全削除
clean:
	docker stop $(container_name) || true
	docker rm $(container_name) || true
	docker rmi $(image_name) || true
	docker volume prune -f
