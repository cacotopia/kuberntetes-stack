#!/bin/bash
# Files are ordered in proper order with needed wait for the dependent custom resource definitions to get initialized.
# Usage: bash kubectl-apply.sh

logSummary(){
    echo ""
    echo "#####################################################"
    echo "Please find the below useful endpoints,"
    echo "JHipster Console - http://registry.supos.com"
    echo "openapi - http://openapi.supos.com"
    echo "#####################################################"
}

kubectl apply -f namespace.yml
kubectl apply -f registry-secret.yml

kubectl apply -f auth/
kubectl apply -f openapi/
kubectl apply -f mp-openapi/

kubectl apply -f accounts/
kubectl apply -f mp-accounts/
kubectl apply -f approvals/
kubectl apply -f bases/
kubectl apply -f notifications/

kubectl apply -f products/
kubectl apply -f orders/
kubectl apply -f payments/
kubectl apply -f developers/
kubectl apply -f apps/

kubectl apply -f accounts-frontend/
kubectl apply -f apps-frontend/
kubectl apply -f boss-mobile-h5/
kubectl apply -f cloud-console-frontend/
kubectl apply -f deprecated-apps-console-frontend/
kubectl apply -f developer-guide-docs/
kubectl apply -f developers-frontend/
kubectl apply -f frontend-mobile-weixin/
kubectl apply -f frontend-open-docs/
kubectl apply -f mp-frontend/
kubectl apply -f static-resource/

kubectl apply -f api-ing.yml
kubectl apply -f galileo-ing.yml
kubectl apply -f mobile-ing.yml

logSummary
