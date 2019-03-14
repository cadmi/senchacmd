IMAGE=cadmi/senchacmd
VERSION=6.7.0.64

build: Dockerfile
	docker build -t $(IMAGE):$(VERSION) .

test:
	docker run --rm $(IMAGE):$(VERSION) help

tag: 
	docker tag $(IMAGE):$(VERSION) $(IMAGE):6.7
	docker tag $(IMAGE):$(VERSION) $(IMAGE):latest

push: 
	docker push $(IMAGE):$(VERSION)
	docker push $(IMAGE):6.7
	docker push $(IMAGE):latest
