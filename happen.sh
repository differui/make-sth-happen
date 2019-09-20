#!/bin/bash

# create folders
mkdir -p $1
mkdir -p $1/src

# create templates
INDEX_TS="console.log('App is ruuning...')"
MODULE_DTS="// declarations for external modules"
GLOBAL_DTS="// declarations for global variables"
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
EDITORCONFIG='root = true

[*]
end_of_line = lf
insert_final_newline = true

[*.{js,tx,tsx,html,css,sass,scss,less,styl}]
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
  "include": ["src/**/*.ts", "src/**/*.tsx"]
}'
GITIGNORE='dist/'
LICENSE='The MIT License (MIT)

Copyright (c) 2016 Thomas Ghysels

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

© 2019 GitHub, Inc.'

# create files
echo "$INDEX_TS" > $1/src/index.ts
echo "$MODULE_DTS" > $1/src/module.d.ts
echo "$GLOBAL_DTS" > $1/src/global.d.ts
echo "$INDEX_HTML" > $1/index.html
echo "$PRETTIERRC" > $1/.prettierrc
echo "$EDITORCONFIG" > $1/.editorconfig
echo "$GITIGNORE" > $1/.gitignore
echo "$TSCONFIG" > $1/tsconfig.json
echo "$LICENSE" > $1/LICENSE

echo "MAKE $1 HAPPEN!"

# make it happen
cd $1
npm init -y > /dev/null
code ./
parcel *.html