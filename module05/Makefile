
all: grafana-install prometheus-install loki-install alloy-install

grafana-install:
	kubectl apply -f argocd/grafana.yaml

prometheus-install:
	kubectl apply -f argocd/prometheus.yaml
	
loki-install:
	kubectl apply -f argocd/loki.yaml
	
alloy-install:
	kubectl apply -f argocd/alloy.yaml
