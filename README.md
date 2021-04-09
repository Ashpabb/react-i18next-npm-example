### NPM v7 removes `build` in favor of `prepare`

For installing packages directly from a remote repository like github, npm by
default will run a `build` script. The syntax for adding a dependency this way:

```zsh
npm install <git remote url>
```

In the package.json afterwards, this shows something like:
```json
  "dependencies": {
    "react-i18next": "github:Ashpabb/react-i18next"
  }
```

The end result is that installing from something like a fork on Github does not
run build scripts and does not include the `dist` folder that would be present
if installing normally.

I've push up the result of this behavior to this repository for demonstration.

### To reproduce

```zsh
➜ node -v
v12.14.1

➜ npm -v
7.7.6

➜ mkdir ~/react-i18next-npm-example
➜ cd ~/react-i18next-npm-example

# Choosing all defaults...
➜ npm init -y

➜ cat package.json 
{
  "name": "react-i18next-npm-example",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC"
}

➜ npm i Ashpabb/react-i18next

# Example output:
#
#   added 10 packages, and audited 11 packages in 26s
#
#   found 0 vulnerabilities

➜ cat package.json 
{
  "name": "react-i18next-npm-example",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "dependencies": {
    "react-i18next": "github:Ashpabb/react-i18next"
  }
  "author": "",
  "license": "ISC"
}

# This is unexpected...
➜ ls node_modules/react-i18next/dist
ls: node_modules/react-i18next/dist: No such file or directory
```

I've included the command set in `command.sh` for reference.
Recommending reading and providing analogous command rather than executing directly.
