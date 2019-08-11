#!/bin/bash

# create folders
mkdir -p $1
mkdir -p $1/src

# create templates
INDEX_TS="console.log('App is ruuning...')"
INDEX_HTML='<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>'$1'</title>
  </head>
  <body>
    <div id="root"></div>
    <script src="./src/index.ts"></script>
  </body>
</html>'
EDITORCONFIG='[*.{js,tx,tsx,html,css,sass,scss,less,styl}]
  indent_style = space
  indent_size = 2'
PRETTIERRC='{
  "trailingComma": "es5",
  "tabWidth": 2,
  "singleQuote": true
}'
TSCONFIG='{
  "compilerOptions": {
    "jsx": "react",
    "lib": ["dom", "es2015"],
    "esModuleInterop": true,
    "noImplicitAny": true
  },
  "include": ["src/*.tsx"]
}'

# create files
echo "$INDEX_TS" > $1/src/index.ts
echo "$INDEX_HTML" > $1/index.html
echo "$PRETTIERRC" > $1/.prettierrc
echo "$EDITORCONFIG" > $1/.editorconfig
echo "$TSCONFIG" > $1/tsconfig.json

echo "MAKE $1 HAPPEN!"

# make it happen
cd $1
npm init -y > /dev/null
code ./
parcel *.html