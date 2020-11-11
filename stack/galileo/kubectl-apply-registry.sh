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

kubectl apply -f registry-namespace.yml
kubectl apply -f registry/


logSummary
