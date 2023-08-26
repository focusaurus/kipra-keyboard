#!/usr/bin/env bash

# Please Use Google Shell Style: https://google.github.io/styleguide/shell.xml

# ---- Start unofficial bash strict mode boilerplate
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -o errexit # always exit on error
set -o errtrace # trap errors in functions as well
set -o pipefail # don't ignore exit codes when piping output
# set -x # enable debugging

IFS=$'\n\t'
# ---- End unofficial bash strict mode boilerplate

cd "$(dirname "${BASH_SOURCE[0]}")/.."
mkdir -p .build
ERGOGEN_DIR="${ERGOGEN_DIR:-$HOME/github.com/ergogen/ergogen}"
node "${ERGOGEN_DIR}/src/cli.js" kipra-v1.ergogen.yaml -o .build