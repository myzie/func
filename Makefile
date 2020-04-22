
AWS ?= aws
APP_NAME ?= func
ENV_TYPE ?= dev
DB_BACKUP_RETENTION ?= 5

.PHONY: deploy
deploy:
	@$(AWS) cloudformation deploy \
		--template-file template.yaml \
		--stack-name $(APP_NAME) \
		--capabilities CAPABILITY_NAMED_IAM \
		--no-fail-on-empty-changeset \
		--parameter-overrides \
			AppName=$(APP_NAME) \
			DatabaseName=$(APP_NAME) \
			EnvType=$(ENV_TYPE) \
			DatabaseBackupRetention=$(DB_BACKUP_RETENTION)
