function kbash() {
    kubectl get pod curl > /dev/null 2>&1
    status=$?

    if [ $status -ne 0 ]; then
        # Not running, create a new one
        kubectl run curl --image=radial/busyboxplus:curl -i --tty --generator=run-pod/v1
    else
                echo 'Attaching...'
                podname=$(kubectl get pods --selector=run=curl -o jsonpath='{.items[*].metadata.name}')
        kubectl attach ${podname} -c curl -i -t
    fi
}
