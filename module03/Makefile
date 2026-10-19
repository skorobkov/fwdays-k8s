GITOPS_REPO = 

all: argocd

argocd: argocd-install argocd-gitops-repo

argocd-install:
	kubectl create namespace argocd || true
	kubectl apply -n argocd --server-side --force-conflicts -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/ha/install.yaml

argocd-deploy:
	kubectl apply -f 'argocd/*.yaml'
