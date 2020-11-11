#!/bin/bash
# Files are ordered in proper order with needed wait for the dependent custom resource definitions to get initialized.
# Usage: bash kubectl-delete.sh

logSummary(){
    echo "delete success"
}

kubectl delete -f registry/

#kubectl delete -f registry-namespace.yml

logSummary
