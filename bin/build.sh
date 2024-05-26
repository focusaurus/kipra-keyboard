#!/usr/bin/env bash

# Please Use Google Shell Style: https://google.github.io/styleguide/shell.xml

# ---- Start unofficial bash strict mode boilerplate
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -o errexit  # always exit on error
set -o errtrace # trap errors in functions as well
set -o pipefail # don't ignore exit codes when piping output
# set -x # enable debugging

IFS=$'\n\t'
# ---- End unofficial bash strict mode boilerplate

cd "$(dirname "${BASH_SOURCE[0]}")/../v2"
mkdir -p build
ERGOGEN_DIR="${ERGOGEN_DIR:-$HOME/github.com/ergogen/ergogen}"
node "${ERGOGEN_DIR}/src/cli.js" . -o build
cp build/pcbs/kipra-v2.kicad_pcb kicad/kipra-v2/kipra-v2.kicad_pcb
find build/cases/ -type f -name '*.jscad' | {
  while IFS= read -r file_path; do
    npx @jscad/cli@1 "${file_path}" -of stla
  done
}
# just display the artifacts for confirmation
find build -type f
