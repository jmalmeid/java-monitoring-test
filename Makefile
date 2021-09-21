APP_NAME=jmalmeid/java-monitoring-test
VERSION=latest

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

all: build push

# DOCKER TASKS
# Build the container
build: ## Build the image
	docker build -t $(APP_NAME):$(VERSION) .

push: ## Push the image
	docker push $(APP_NAME):$(VERSION)

