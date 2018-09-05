#!/bin/bash

# e.g.) ./scripts/kustomize.sh build kubernetes/overlays/develop/ | kubectl apply -f -
# e.g.) ./scripts/kustomize-apply.sh kubernetes/overlays/develop/

set -x

KUSTOMIZE_OVERLAY=$1

KUSTOMIZE_VERSION=1.0.7

alias kubectl="/builder/kubectl.bash"

which kubectl

if which kustomize ; then
  kustomize build $KUSTOMIZE_OVERLAY | kubectl apply -f -
  exit 0
fi

curl -s https://api.github.com/repos/kubernetes-sigs/kustomize/releases/latest |\
  grep browser_download |\
  grep linux |\
  cut -d '"' -f 4 |\
  xargs curl -L -o /usr/local/bin/kustomize
chmod +x /usr/local/bin/kustomize

kustomize build $KUSTOMIZE_OVERLAY | kubectl apply -f -
