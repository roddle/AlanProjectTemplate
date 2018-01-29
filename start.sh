#!/bin/bash
set -e

if [[ $(uname) == "Darwin" ]]; then
	PLATFORM="darwin-x64"
else
	PLATFORM="linux-x64"
	if grep -q Microsoft /proc/version; then
		WSL=true
	fi
fi

if [ ! -d tools ]; then
	echo ""
	echo "Downloading tools"
	curl -# -o .temp.tar.gz "https://alan-platform.com/utils/6/${PLATFORM}/utils.tar.gz"
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
	pushd shared/models/model >> /dev/null
	../../../alan validate --wire
	popd >> /dev/null
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

mkdir -p deployments/demo/instances/server/
echo "{}" | ./devenv/system-types/datastore-next/tools/datastore-instance-repair devenv/output/interm/objects/server.d/package > deployments/demo/instances/server/instance.json

echo ""
echo "Packaging the project"
./alan package deployments/demo

if [[ $WSL = true ]]; then
	echo ""
	echo "Deploying the stack"
	./alan deploy --path ~/runenv
	if [[ $1 == "--build-only" ]]; then
		echo "Build succesfull"
		exit 0
	fi
	echo ""
	echo "Starting the stack"
	./alan run ~/runenv
else
	echo ""
	echo "Deploying the stack"
	./alan deploy
	if [[ $1 == "--build-only" ]]; then
		echo "Build succesfull"
		exit 0
	fi
	echo ""
	echo "Starting the stack"
	./alan run
fi
