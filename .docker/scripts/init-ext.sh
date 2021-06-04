#!/usr/bin/env sh
##
# Install current extension.
#
set -e

cd $SRC_DIR/app
pip install -r "requirements.txt"
pip install -r "requirements-dev.txt"
python setup.py develop

# Validate that the extension was installed correctly.
if ! pip list | grep ckanext-data-qld-theme > /dev/null; then echo "Unable to find the extension in the list"; exit 1; fi

