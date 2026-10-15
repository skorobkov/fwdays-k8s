USERS = mentor student01 student02 student03

NS   ?= $(USER)
KCFG  = $(USER).kubeconfig

SERVER := $(shell kubectl config view --minify -o jsonpath='{.clusters[0].cluster.server}')
CA     := $(shell kubectl config view --minify --raw -o jsonpath='{.clusters[0].cluster.certificate-authority-data}')

all: apply kubeconfigs

apply:
	kubectl apply -f '*.yaml'

kubeconfigs:
	for u in $(USERS); do $(MAKE) kubeconfig USER=$$u || exit 1; done

kubeconfig:
	kubectl config --kubeconfig=$(KCFG) set-cluster k8s --server=$(SERVER)
	kubectl config --kubeconfig=$(KCFG) set clusters.k8s.certificate-authority-data $(CA)
	kubectl config --kubeconfig=$(KCFG) set-credentials $(USER) --token=$$(kubectl -n $(NS) create token $(USER) --duration=24h)
	kubectl config --kubeconfig=$(KCFG) set-context $(USER) --cluster=k8s --user=$(USER) --namespace=$(NS)
	kubectl config --kubeconfig=$(KCFG) use-context $(USER)
