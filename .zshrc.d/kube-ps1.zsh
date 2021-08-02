autoload -U colors; colors

function _kube_ps1_cluster_function() {
  local color
  case $1 in
    *-staging)
      color="gray"
      ;;
    *)
      color="red"
      ;;
  esac

  echo "%{$fg[$color]%}$1%{$reset_color%}"
}

function _kube_ps1_namespace_function() {
  local color
  case $1 in
    delivery)
      color="gray"
      ;;
    *)
      color="red"
      ;;
  esac

  echo "%{$fg[$color]%}$1%{$reset_color%}"
}

export KUBE_PS1_PREFIX=""
export KUBE_PS1_SUFFIX=""
export KUBE_PS1_CTX_COLOR=""
export KUBE_PS1_NS_COLOR=""
export KUBE_PS1_SYMBOL_ENABLE="false"
export KUBE_PS1_CLUSTER_FUNCTION=_kube_ps1_cluster_function
export KUBE_PS1_NAMESPACE_FUNCTION=_kube_ps1_namespace_function
