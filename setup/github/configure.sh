#/bin/bash

set -e

FILE="$HOME/.ssh/id_rsa.pub"

if [ -f $FILE ]; then
  echo "ssh keys already exist"
else
  echo "Generating ssh keys"
  ssh-keygen -t rsa -b 4096 -C chris@codegoalie.com
fi

echo ""
cat ~/.ssh/id_rsa.pub
echo "\nAdd the above key to GitHub at http://github.com/settings/ssh/new"
echo "Press [Enter] to continue..."
read _
