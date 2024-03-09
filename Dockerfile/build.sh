#!/bin/bash

# Get folder name
# folder=$(ls /app | grep -v '\.sh$')

# cd /app/$folder && mix deps.get
cd /app/phoenix && mix deps.get
# 最好多执行一次
cd /app/phoenix && mix deps.get 
# Generate secret
# cd /app/phoenix && mix phx.gen.secret
secret=$(cd /app/phoenix && mix phx.gen.secret | tail -n 1)
export SECRET_KEY_BASE=$secret


cd /app/phoenix && mix deps.get --only prod
cd /app/phoenix && MIX_ENV=prod mix compile

# 静态资源配置
cd /app/phoenix && mix phx.digest

# 发布release
cd /app/phoenix && MIX_ENV=prod mix release

echo "The SECRET_KEY_BASE is:"
echo $SECRET_KEY_BASE
cd /app/phoenix && echo $SECRET_KEY_BASE > SECRET.txt

echo "The deployment environment,please to execute: export SECRET_KEY_BASE=SECRET_KEY_BASE VALUE"
