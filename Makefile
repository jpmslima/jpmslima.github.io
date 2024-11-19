SHELL := /bin/bash
GH_PAGE := jpmslima.github.io

.PHONY: deploy
deploy:
	cd $(GH_PAGE) && mkdocs gh-deploy --config-file ../mkdocs.yml --remote-branch main
.PHONY: update-build-version
update-build-version:
	git submodule update --remote --merge
	git add $(GH_PAGE)
	git commit -m "ci: update build version"
.PHONY: publish
publish: deploy update-build-version
	git push