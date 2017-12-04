#!/bin/bash
set -e

if [[ $(uname) == "Darwin" ]]; then
	PLATFORM="darwin-x64"
else
	PLATFORM="linux-x64"
fi

if [ ! -d tools ]; then
	echo ""
	echo "Downloading tools"
	curl -o .temp.tar.gz https://alan.m-industries.com/utils/5/"${PLATFORM}"/utils.tar.gz
	tar xf  .temp.tar.gz -C .
	rm      .temp.tar.gz
fi

if [ ! -d devenv ]; then
	echo ""
	echo "Downloading devenv"
	./alan fetch
fi

if [ -f devenv/output/interm/wiring.pkg ]; then
	echo ""
	echo "Checking the model"
	cd models/model
	../../alan validate --wire
	cd ../..
fi

echo ""
echo "Generating the GUI"
rm -f systems/client/definition/annotations.alan
./devenv/system-types/auto-webclient-next/system-scripts/generate_annotations.sh systems/client/definition/

echo ""
echo "Building the project"
./alan build --all-yes

echo ""
echo "Creating runtime storage at ~/runenv"

rm -rf   ~/runenv/stack/sandbox/data/server/session/
mkdir -p ~/runenv/stack/sandbox/data/server/session/
echo "{}" | ./devenv/system-types/datastore-next/tools/repair-instance-data devenv/output/interm/objects/server.d/package > ~/runenv/stack/sandbox/data/server/session/init-0000000000000000.json

./alan run devenv/output/demo.img ~/runenv
