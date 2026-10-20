.PHONY: istio-install istio-admission

all: istio-install istio-admission

istio-install: gateway-api-crd
	kubectl apply -f argocd/istio.yaml

istio-admission:
	kubectl apply -f argocd/istio-admission.yaml

gateway-api-crd:
	kubectl apply --server-side -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.6.1/standard-install.yaml

