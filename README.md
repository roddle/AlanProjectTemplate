# Fabric Project Template

All the basics you need to create and run a Fabric application.


## Getting started

To get started, make sure you have installed the Fabric utilities:
https://www.m-industries.com/fabric.html

Then in a terminal run:
1. `fabric fetch`
2. `fabric build --all yes` (note: this will fail)
3. `./devenv/system-types/auto-webclient/system-scripts/generate_annotations.sh systems/client/definition/`

Now you're ready to edit models/model/application.alan. To update the annotations you can:

- edit system/client/definition/annotations.alan by hand
- or remove the file and run step 3 again
- run step 3 without removing the existing annotations and compare them against annotations_generated

## Running your application

In a terminal, from the root of this project run:

- `fabric run devenv/output/demo.img runenv`

This will create a runenv directory and download the runtime binaries. It will fail because there is no data to run with yet. To create an initial set run:

- `echo "{}" | ./devenv/system-types/datastore/tools/repair-instance-data devenv/output/interm/objects/server.d/package > runenv/stack/sandbox/data/server/session/init-0000000000000000.json`

If you change elementary data in your model, chances are it will invalidate your data. You can migrate it, or attempt a repair. As long as you're still sketching out your model it problably best to remove the session folder (runenv/stack/sandbox/data/server/session/) and create a new initial dataset.
