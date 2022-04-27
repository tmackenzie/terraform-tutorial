SHELL := /bin/bash

build:
	docker build -t my-first-ecr-repo .

run:
	docker run --publish 3000:3000 my-first-ecr-repo

publish: build
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 221039308519.dkr.ecr.us-east-1.amazonaws.com
	docker tag my-first-ecr-repo:latest 221039308519.dkr.ecr.us-east-1.amazonaws.com/my-first-ecr-repo:latest
	docker push 221039308519.dkr.ecr.us-east-1.amazonaws.com/my-first-ecr-repo:latest

plan:
	cd terraform; tfswitch
	cd terraform; terraform init -input=false
	cd terraform; terraform plan -input=false -no-color -compact-warnings -out plan.tfplan

apply:
	cd terraform; tfswitch
	cd terraform; terraform init -input=false
	cd terraform; terraform apply -input=false -no-color -compact-warnings -auto-approve

destroy:
	cd terraform; tfswitch
	cd terraform; terraform init -input=false
	cd terraform; terraform destroy -input=false -no-color -compact-warnings

