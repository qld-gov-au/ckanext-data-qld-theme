#!/usr/bin/env sh
##
# Install current extension.
#
set -e

. $WORKDIR/bin/activate

pip install -r "$SRC_DIR/app/requirements.txt"
pip install -r "$SRC_DIR/app/requirements-dev.txt"
python setup.py develop

# Validate that the extension was installed correctly.
if ! pip list | grep ckanext-data-qld-theme > /dev/null; then echo "Unable to find the extension in the list"; exit 1; fi

deactivate
