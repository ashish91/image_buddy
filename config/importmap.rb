# Pin npm packages by running ./bin/importmap

pin "application", preload: true

pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.2.3/dist/js/bootstrap.esm.js"

pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.8/lib/index.js"
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.7.1/dist/jquery.js"

pin "react", to: "https://ga.jspm.io/npm:react@18.2.0/index.js"
pin "react-dom", to: "https://ga.jspm.io/npm:react-dom@18.2.0/index.js"
pin "scheduler", to: "https://ga.jspm.io/npm:scheduler@0.23.0/index.js"
pin "htm", to: "https://cdn.esm.sh/v45/htm@3.1.1/es2021/htm.mjs"

pin "@babel/core", to: "https://cdn.jsdelivr.net/npm/@babel/core@7.23.6/lib/index.min.js"

pin_all_from "app/javascript/components", under: "components"
