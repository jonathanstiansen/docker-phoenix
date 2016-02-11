#!/usr/bin/env sh
mix ecto.create
mix ecto.migrate
mix phoenix.server
