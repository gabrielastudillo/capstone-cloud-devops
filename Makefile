docker-build: docker build --tag=devopsapp .

# docker-upload: 

# run-kube: 

lint:
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	# pylint --disable=R,C,W1203 app.py

all: install lint test