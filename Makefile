REPO_NAME := temmiecvml
APP_NAME := lingua_trainer/word_explorer
IMAGE_TAG := 0.0.1
DOCKERFILE := Dockerfile.lingua_trainer
DOCKERHUB_USERNAME := $(REPO_NAME)
DOCKERHUB_PASSWORD := $(shell echo $$DOCKERHUB_PASSWORD)

login:
	docker login -u $(DOCKERHUB_USERNAME) -p -u $(DOCKERHUB_PASSWORD)
	
build:
	docker build --progress=plain -f $(DOCKERFILE) . --no-cache -t $(REPO_NAME)/$(APP_NAME):$(IMAGE_TAG)
	
push:
	docker push $(REPO_NAME)/$(APP_NAME):$(IMAGE_TAG)

pull:
	docker pull $(REPO_NAME)/$(APP_NAME):$(IMAGE_TAG)

run:
	docker run -d -p 80:8501 $(REPO_NAME)/$(APP_NAME):$(IMAGE_TAG)