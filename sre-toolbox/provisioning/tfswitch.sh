#!/bin/bash -xv
set -Eeuo pipefail
echo "Installing tfswitch"
curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/master/install.sh | bash
