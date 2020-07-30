.PHONY: help all clean build publish

#====================================================================
# PHONY TARGETS

help: 
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

all: clean publish # Limpeza, upload e sincronizacao git
	git add -u
	git commit -m "Atualiza obitos"
	git push origin master

clean: data/obitos-confirmados-covid-19.csv ## Limpeza data-raw/ para data/

data/obitos-confirmados-covid-19.csv: scripts/clean.R scripts/lib/utils.R data-raw/OBITOS_CONF_COVID-19_MG.xlsx
	Rscript --verbose $< 2> logs/log.Rout

build: ## Compilação datapackage.json para buid/
	Rscript --verbose scripts/build.R 2> logs/log.Rout

publish: ## Upload data/ para dados.mg.gov.br/
	Rscript --verbose scripts/publish.R 2> logs/log.Rout