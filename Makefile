# Include Environment Variables
include .env

help: ## Displays all available Commands
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

start_project: ## Starts the Project
	docker compose up

stop_project: ## Stops the Project
	docker compose stop

destroy_project: ## Deletes the Project
	docker compose down -v
	docker rmi ${PROJECT}
