#!/bin/bash

items=(
    "mon-prometheus-ns.yml"
    "mon-prometheus-pv.yml"
    "mon-alertmanager-config.yml"
    "mon-prometheus-config.yml"
    "mon-grafana-config.yml"
    "mon-alertmanager-deploy.yml"
    "mon-prometheus-deploy.yml"
    "mon-grafana-deploy.yml"
    "mon-kube-state-metrics.yml"
)

function create {
    for I in ${items[*]}; do
        kubectl apply -f "$I" || exit 1
    done
}

function delete {
    pos="${#items[*]}"
    pos="$((pos-1))"

    while [[ "$pos" -ge "0" ]]; do
        kubectl delete -f "${items[$pos]}" || exit 1
        pos="$((pos-1))"
    done
}

case "$1" in
    "create") create ;;
    "delete") delete ;;
      "list") kubectl -n monitoring get all ;;
           *) echo -e "$0 <create | delete | list>" ;;
esac
