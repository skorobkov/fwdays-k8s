.PHONY: istio-install istio-admission

all: istio-install istio-admission

istio-install:
	kubectl apply -f argocd/istio.yaml

istio-admission:
	kubectl apply -f argocd/istio-admission.yaml
