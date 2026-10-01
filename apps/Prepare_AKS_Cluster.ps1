# Flux Extension installieren
az k8s-extension create `
  --cluster-name aks-data-cls2 `
  --cluster-type connectedClusters `
  --resource-group rg-azl-cls2-aks-data `
  --name flux `
  --extension-type microsoft.flux

# Flux Extension konfigurieren
az k8s-configuration flux create `
  --cluster-name aks-data-cls2 `
  --resource-group rg-azl-cls2-aks-data `
  --cluster-type connectedClusters `
  --name wordpress-prod `
  --namespace flux-system `
  --scope cluster `
  --url https://github.com/eszych/wordpress-gitops `
  --branch main `
  --kustomization name=production path=./clusters/production prune=true

# Flux Status pruefen
az k8s-configuration flux show `
  --cluster-name aks-data-cls2 `
  --resource-group rg-azl-cls2-aks-data `
  --cluster-type connectedClusters `
  --name wordpress-prod

kubectl get helmrepositories -A

