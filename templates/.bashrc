# do not edit this file. put files in the dir below.
for FN in $HOME/.local/bashrc.d/*.sh ; do
  source "$FN"
done

# use this for timing info
# { time (
#   echo $FN
#   source "$FN"
# ) }
