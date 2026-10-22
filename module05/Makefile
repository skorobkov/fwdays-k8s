
all: grafana-install prometheus-install

grafana-install:
	kubectl apply -f argocd/grafana.yaml

prometheus-install:
	kubectl apply -f argocd/prometheus.yaml
