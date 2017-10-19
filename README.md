# Fabric Project Template

All the basics you need to create and run a Fabric application.


## Getting started

To get started, make sure you have installed the Fabric utilities:
https://github.com/M-industries/FabricProjectTemplate/wiki

Then in a terminal run:
1. `fabric fetch`
2. `fabric build --all yes` (note: this will fail)
3. `./devenv/system-types/auto-webclient-next/system-scripts/generate_annotations.sh systems/client/definition/`

Now you're ready to edit models/model/application.alan. To update the annotations you can:

- edit system/client/definition/annotations.alan by hand
- or remove the file and run step 3 again
- run step 3 without removing the existing annotations and compare them against the newly generated annotations_generated.alan

## Running your application

In a terminal, from the root of this project run:

- `fabric run devenv/output/demo.img <runenv>`

Replace `<runenv>` with directory of your choosing. Just `runenv` is fine on macOS and Linux, but under WSL you should point it to something in your Linux home dir (because of some minor interop issues), e.g. `~/runenv`.

This will create a runenv directory and download the runtime binaries. It will fail because there is no data to run with yet, but that's ok. To create an initial dataset run:

- `echo "{}" | ./devenv/system-types/datastore-next/tools/repair-instance-data devenv/output/interm/objects/server.d/package > <runenv>/stack/sandbox/data/server/session/init-0000000000000000.json`

Again, `<runenv>` should be replaced with the runenv dir you picked.

Most changes to your model will invalidate your dataset. As long as you're still sketching out your model it problably best to create a new initial dataset every time you want to run it.
