#!/bin/bash
# Files are ordered in proper order with needed wait for the dependent custom resource definitions to get initialized.
# Usage: bash kubectl-delete.sh

logSummary(){
    echo "delete success"
}

kubectl delete -f openapi/
kubectl delete -f mp-openapi/
kubectl delete -f auth/

kubectl delete -f bases/
kubectl delete -f accounts/
kubectl delete -f mp-accounts/
kubectl delete -f approvals/
kubectl delete -f notifications/
kubectl delete -f orders/
kubectl delete -f products/
kubectl delete -f payments/

kubectl delete -f apps/
kubectl delete -f developers/

kubectl delete -f accounts-frontend/
kubectl delete -f apps-frontend/
kubectl delete -f boss-mobile-h5/
kubectl delete -f cloud-console-frontend/
kubectl delete -f deprecated-apps-console-frontend/
kubectl delete -f developer-guide-docs/
kubectl delete -f developers-frontend/
kubectl delete -f frontend-mobile-weixin/
kubectl delete -f frontend-open-docs/
kubectl delete -f mp-frontend/
kubectl apply -f static-resource/

kubectl delete -f registry-secret.yml
kubectl delete -f galileo-ing.yml
kubectl delete -f mobile-ing.yml
kubectl delete -f nginx-proxy/

logSummary
