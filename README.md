# SaferCloud3000 server

This is a the server for [safercloud3000client](https://github.com/ok2094/safercloud3000client)

## Installation

1. [Install required dependencies](https://github.com/amberframework/online-docs/blob/master/getting-started/quickstart/zero-to-deploy.md#install-crystal-and-amber)
2. Run `shards install`

## Usage

To setup your database edit `database_url` inside `config/environments/development.yml` file.

To edit your production settings use `amber encrypt`. [See encrypt command guide](https://github.com/amberframework/online-docs/blob/master/getting-started/cli/encrypt.md#encrypt-command)

To run amber server in a **development** enviroment:

```
amber db create migrate
amber watch
```

To build and run a **production** release:

1. Add an environment variable `AMBER_ENV` with a value of `production`
2. Run these commands (Note using `--release` is optional and may take a long time):

```
npm run release
amber db create migrate
shards build --production --release
./bin/safercloud3000
```
