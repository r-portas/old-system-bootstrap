function k3d-up
  k3d cluster create default \
    -p "8080:80@loadbalancer" \
    -v /dev/mapper:/dev/mapper \
    --k3s-server-arg "--disable=traefik"

  k3d kubeconfig merge default --kubeconfig-switch-context
end
