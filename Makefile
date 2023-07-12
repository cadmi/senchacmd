.PHONY: build test tag push

IMAGE=cadmi/senchacmd
VERSION=7.7.0.36

build:
	docker build -t $(IMAGE):$(VERSION) .

test:
	docker run --rm $(IMAGE):$(VERSION) sencha help

tag: 
	docker tag $(IMAGE):$(VERSION) $(IMAGE):7.7
	docker tag $(IMAGE):$(VERSION) $(IMAGE):latest
	docker tag $(IMAGE):$(VERSION) ghcr.io/$(IMAGE):$(VERSION)
	docker tag $(IMAGE):$(VERSION) ghcr.io/$(IMAGE):7.7
	docker tag $(IMAGE):$(VERSION) ghcr.io/$(IMAGE):latest

push: tag
	docker push $(IMAGE):$(VERSION)
	docker push $(IMAGE):7.7
	docker push $(IMAGE):latest
	docker push ghcr.io/$(IMAGE):$(VERSION)
	docker push ghcr.io/$(IMAGE):7.7
	docker push ghcr.io/$(IMAGE):latest
