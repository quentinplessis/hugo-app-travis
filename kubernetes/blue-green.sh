
export K8S_APP_NAME="hugo-app"
export K8S_SERVICE_NAME="hugo-app-svc"
export PROD_COLOR=`kubectl get svc ${K8S_SERVICE_NAME} --output=jsonpath={.spec.selector.color}`
export TARGET_COLOR=`if [ "$PROD_COLOR" == "blue" ]; then echo "green"; else echo "blue"; fi`

kubectl set selector svc/${K8S_SERVICE_NAME} app=${K8S_APP_NAME},color=${TARGET_COLOR}
