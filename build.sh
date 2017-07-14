#!/bin/bash
set -e

echo -e "\033[33mBuilding models\033[0m"

pushd models/model >> /dev/null

../../devenv/platform/alan/tools/compiler-project ../../devenv/platform/model/language ../../devenv/libraries/model/model.lib

popd >> /dev/null


echo -e "\033[33mRunning build-system\033[0m"

./devenv/platform/build-configuration/tools/buildenvironment-build-system devenv/platform/fabric-build/package --phase generate
./devenv/platform/build-configuration/tools/buildenvironment-build-system devenv/platform/fabric-build/package --phase build
./devenv/platform/build-configuration/tools/buildenvironment-build-system devenv/platform/fabric-build/package --phase build-deployment
./devenv/platform/build-configuration/tools/buildenvironment-build-system devenv/platform/fabric-build/package --phase package
