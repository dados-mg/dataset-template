.PHONY: help all clean build publish

#====================================================================
# PHONY TARGETS

help: 
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

all: clean publish # Limpeza, upload e sincronizacao git
	git add -u
	git commit -m "Atualiza dataset"
	git push origin master

clean: ## Limpeza data-raw/ para data/
	Rscript --verbose scripts/clean.R 2> logs/log.Rout

build: ## Compilação datapackage.json para buid/
	Rscript --verbose scripts/build.R 2> logs/log.Rout

publish: ## Upload data/ para dados.mg.gov.br/
	Rscript --verbose scripts/publish.R 2> logs/log.Rout