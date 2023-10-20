REPO_NAME := temmiecvml
APP_NAME := lingua_trainer
VERSION := 0.0.2
DOCKERFILE := Dockerfile.lingua_trainer
CI_REGISTRY_USER := $(REPO_NAME)
CI_REGISTRY_PASSWORD := $(shell echo $$CI_REGISTRY_PASSWORD)
TARGET_PLATFORM := linux/amd64
CI_REGISTRY := docker.io # docker hub
CI_REGISTRY_IMAGE := index.docker.io/$(REPO_NAME)/$(APP_NAME):$(VERSION)

login:
	docker login --username $(CI_REGISTRY_USER) --password-stdin $(CI_REGISTRY_PASSWORD) $(CI_REGISTRY)
	
build:
	docker build --progress=plain --platform $(TARGET_PLATFORM) -f $(DOCKERFILE) . --no-cache -t $(CI_REGISTRY_IMAGE)
	
push:
	docker push $(CI_REGISTRY_IMAGE)

pull:
	docker pull $(CI_REGISTRY_IMAGE)

run:
	docker run -d -p 80:8501 $(CI_REGISTRY_IMAGE)
