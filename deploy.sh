#!/usr/bin/env bash

set -euo pipefail

npm --prefix functions install
npm --prefix functions run lint
npm --prefix functions run compile

PACKAGE_DIR=functions-package
rm -rf $PACKAGE_DIR
mkdir $PACKAGE_DIR
cp -r functions/{package.json,package-lock.json,dist} $PACKAGE_DIR/
npm --prefix $PACKAGE_DIR install --only=prod

sam build --base-dir $PACKAGE_DIR
sam deploy
