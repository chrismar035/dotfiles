# do not edit this file. put files in the dir below.
source ~/.bashrc
for FN in $HOME/.local/profile.d/*.sh ; do
  source "$FN"
done

# use this for timing info
# { time (
#   echo $FN
#   source "$FN"
# ) }
