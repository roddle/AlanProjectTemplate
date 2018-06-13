You are looking at the project template for the Alan Application Platform.


How to use Alan
===============================================================================
Basic steps to build your project:

1. ./alan bootstrap
2. ./alan build
3. ./alan package devenv/output/project.definition deployments/demo


Getting Alan
------------
You can download the `alan` utility, and the tools it uses, here:
- https://alan-platform.com/utils/2018.28/darwin-x64.tar.gz
- https://alan-platform.com/utils/2018.28/linux-x64.tar.gz
- https://alan-platform.com/utils/2018.28/windows-x64.tar.gz

You can put `alan` in your project root and call it from there. In some cases it's easier to make it available everywhere via `$PATH`. Note that it will download its dependencies into an alan-tools directory.


Getting an Alan Application Server
----------------------------------
Get a server by running a one-liner in a Unix-like shell:

MacOs:
```sh
bash -c "mkdir -p data runenv/image && curl -s https://alan-platform.com/utils/2018.28/darwin-x64/application-server.tar.gz | tar xzf - -C runenv/image && ln -s runenv/image/application-server application-server"
```
Linux:
```sh
bash -c "mkdir -p data runenv/image && curl -s https://alan-platform.com/utils/2018.28/linux-x64/application-server.tar.gz | tar xzf - -C runenv/image && ln -s runenv/image/application-server application-server"
```

You can start the server by running:
```sh
./application-server 127.0.0.1 12345
```



Modifying applications
===============================================================================
1. Edit the application.alan
2. Run ./alan build
3. Update a migration to define the initial data

For documentation for the languages you're likely to work with:
https://github.com/M-industries/Docs


Data Migration
--------------
Example layout for a migrations ("dataenv") environment:

```
migrations/
  \_ versions.json
  \_ from_version_x/
        \_ build.json
        \_ migration.alan
        \_ regexp.alan
        \_ from/
              \_ application.alan
        \_ to/
              \_ application.alan(.link)
```

> The versions.json would be the same as the one in your project, but with only the "datastore" system type and the platform version.

To build the migrations:

1. ./alan bootstrap
2. ./alan build

This will produce a from_version_x.migration package that can be used in a deployment. To do so, copy it to the deployment. In a very basic project the correct location would be `deployments/demo/instances/server.migration`.



Running an image on the server
===============================================================================
Once you have a working server, you're ready to run an image on it.

One application server can manage multiple applications (aka "stacks").
Connect to the server ask for `--help` for a list of available commands.

The `--batch replace` command backups old stacks and can be used in scripts:

```
alan connect 127.0.0.1 12345 --batch replace "demo" image
```



----------------

License: [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)
Covers non-commercial applications. For commercial applications without support, escrow or integration with commercial system, a free SE license can be requested. For other applications please contact info@m-industries.com.
