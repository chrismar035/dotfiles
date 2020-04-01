alias k=kubectl

kpatch () {
  kubectl patch deployment $1 -p \
  "{\"spec\":{\"template\":{\"metadata\":{\"labels\":{\"date\":\"`date +'%s'`\"}}}}}" $2
}
