
export K8S_APP_NAME="hugo-app"
export K8S_SERVICE_NAME="hugo-app-svc"
export K8S_TEMP_SERVICE_NAME="${K8S_SERVICE_NAME}-temp"
export OLD_COLOR=`kubectl get svc ${K8S_SERVICE_NAME} --output=jsonpath={.spec.selector.color}`
export NEW_COLOR=`if [ "$OLD_COLOR" == "blue" ]; then echo "green"; else echo "blue"; fi`

kubectl set selector svc/${K8S_SERVICE_NAME} app=${K8S_APP_NAME},color=${NEW_COLOR}
kubectl set selector svc/${K8S_TEMP_SERVICE_NAME} app=${K8S_APP_NAME},color=${OLD_COLOR}
