# Animu Backend

The main purpose of this app is to serve Anime details and authentication features.


# Table of contents:

- [Pre-reqs](#pre-requisites)
- [Getting started](#getting-started)
- [Project Structure](#project-structure)
	- [Building the project](#building-the-project)
	- [Type Definition (`.d.ts`) Files](#type-definition-dts-files)
	- [Debugging](#Using-the-debugger-in-VS-Code)
	- [Testing](#testing)
- [VS Code Extensions](#VSCode-Extensions)
- [JWOC Contribution](#contributions)

# Pre-requisites
To build and run this app locally you will need a few things:
- Install [Node.js](https://nodejs.org/en/)
- Install [MongoDB](https://docs.mongodb.com/manual/installation/)
- Install [VS Code](https://code.visualstudio.com/)

# Getting started
- Clone the repository
```
git clone --depth=1 https://github.com/Abhigyan103/animu-backend.git
```
- Install dependencies
```
cd animu_backend
npm i
```
- Run the project
```
npm run dev
```

> **Note on editors!** - TypeScript has great support in [every editor](http://www.typescriptlang.org/index.html#download-links), but this project has been pre-configured for use with [VS Code](https://code.visualstudio.com/).

Finally, navigate to `http://localhost:8000` and you should see the template being served and rendered locally!

# Project Structure
The most obvious difference in a TypeScript + Node project is the folder structure.
In a TypeScript project, it's best to have separate _source_  and _distributable_ files.
TypeScript (`.ts`) files live in your `src` folder and after compilation are output as JavaScript (`.js`) in the `dist` folder.
The `test` and `views` folders remain top level as expected.

The full folder structure of this app is explained below:

> **Note!** Make sure you have already built the app using `npm run build`

| Name | Description |
| ------------------------ | ---------------------------------------------------------------------------------------------- |
| **dist**                 | Contains the distributable (or output) from your TypeScript build. This is the code you ship   |
| **node_modules**         | Contains all your npm dependencies                                                             |
| **src**                  | Contains your source code that will be compiled to the dist dir                                |
| **src/controllers**      | Controllers define functions that respond to various http requests                             |
| **src/db**               | Models define Mongoose schemas that will be used in storing and retrieving data from MongoDB   |
| **src/helpers**          | All the utility funtions reside here                                                           |
| **src/middlewares**      | Holds the custom middlewares for the server                                                    |
| **src/router**           | Provides the various endpoints for the API                                                     |
| **src**/index.ts         | Entry point to your express app                                                                |
| **src**/connect.ts       | Function for connection with the MongoDB                                                       |
| .env.example             | API keys, tokens, passwords, database URI. Clone this, but don't check it in to public repos.  |
| jest.config.js           | Used to configure Jest running tests written in TypeScript                                     |
| package.json             | File that contains npm dependencies as well as [build scripts](#what-if-a-library-isnt-on-definitelytyped)                                                                                |
| nodemon.json             | File that contains entrypoint point for nodemon                                                |
| tsconfig.json            | Config settings for compiling server code written in TypeScript                                |
| tsconfig.tests.json      | Config settings for compiling tests written in TypeScript                                      |

# Type Definition `dts` Files
For the most part, you'll find `.d.ts` files for the libraries you are using on DefinitelyTyped.
These `.d.ts` files can be easily installed into your project by using the npm scope `@types`.
For example, if we want the `.d.ts` file for jQuery, we can do so with `npm install --save-dev @types/jquery`.

> **Note!** Because we're using `"noImplicitAny": true`, we are required to have a `.d.ts` file for **every** library we use. While you could set `noImplicitAny` to `false` to silence errors about missing `.d.ts` files, it is a best practice to have a `.d.ts` file for every library. (Even if the `.d.ts` file is [basically empty!](#writing-a-dts-file))

> **Note!** Be sure to add `--save-dev` (or `-D`) to your `npm install`. `.d.ts` files are project dependencies, but only used at compile time and thus should be dev dependencies.

In this template, all the `.d.ts` files have already been added to `devDependencies` in `package.json`, so you will get everything you need after running your first `npm install`.
Once `.d.ts` files have been installed using npm, you should see them in your `node_modules/@types` folder.
The compiler will always look in this folder for `.d.ts` files when resolving JavaScript libraries.

### What if a library isn't on DefinitelyTyped?
If you try to install a `.d.ts` file from `@types` and it isn't found, or you check DefinitelyTyped and cannot find a specific library, you will want to create your own `.d.ts file`.
In the `src` folder of this project, you'll find the `types` folder which holds the `.d.ts` files that aren't on DefinitelyTyped (or weren't as of the time of this writing).

#### Setting up TypeScript to look for `.d.ts` files in another folder
The compiler knows to look in `node_modules/@types` by default, but to help the compiler find our own `.d.ts` files we have to configure path mapping in our `tsconfig.json`.
Path mapping can get pretty confusing, but the basic idea is that the TypeScript compiler will look in specific places, in a specific order when resolving modules, and we have the ability to tell the compiler exactly how to do it.
In the `tsconfig.json` for this project you'll see the following:
```json
"baseUrl": ".",
"paths": {
    "*": [
        "node_modules/*",
        "src/types/*"
    ]
}
```
This tells the TypeScript compiler that in addition to looking in `node_modules/@types` for every import (`*`) also look in our own `.d.ts` file location `<baseUrl>` + `src/types/*`.
So when we write something like:
```ts
import * as flash from "express-flash";
```
First the compiler will look for a `d.ts` file in `node_modules/@types` and then when it doesn't find one look in `src/types` and find our file `express-flash.d.ts`.

#### Using `dts-gen`
Unless you are familiar with `.d.ts` files, I strongly recommend trying to use the tool [dts-gen](https://github.com/Microsoft/dts-gen) first.
The [README](https://github.com/Microsoft/dts-gen#dts-gen-a-typescript-definition-file-generator) does a great job explaining how to use the tool, and for most cases, you'll get an excellent scaffold of a `.d.ts` file to start with.
In this project, `bcrypt-nodejs.d.ts`, `fbgraph.d.ts`, and `lusca.d.ts` were all generated using `dts-gen`.

#### Writing a `.d.ts` file
If generating a `.d.ts` using `dts-gen` isn't working, [you should tell me about it first](https://www.surveymonkey.com/r/LN2CV82), but then you can create your own `.d.ts` file.

If you just want to silence the compiler for the time being, create a file called `<some-library>.d.ts` in your `types` folder and then add this line of code:
```ts
declare module "<some-library>";
```
If you want to invest some time into making a great `.d.ts` file that will give you great type checking and IntelliSense, the TypeScript website has great [docs on authoring `.d.ts` files](http://www.typescriptlang.org/docs/handbook/declaration-files/introduction.html).

#### Contributing to DefinitelyTyped
The reason it's so easy to get great `.d.ts` files for most libraries is that developers like you contribute their work back to DefinitelyTyped.
Contributing `.d.ts` files is a great way to get into the open source community if it's something you've never tried before, and as soon as your changes are accepted, every other developer in the world has access to your work.

If you're interested in giving it a shot, check out the [guidance on DefinitelyTyped](https://github.com/definitelyTyped/DefinitelyTyped/#how-can-i-contribute).
If you're not interested, [you should tell me why](https://www.surveymonkey.com/r/LN2CV82) so we can help make it easier in the future!

## Using the debugger in VS Code
Debugging is one of the places where VS Code really shines over other editors.
Node.js debugging in VS Code is easy to set up and even easier to use.
This project comes pre-configured with everything you need to get started.

When you hit `F5` in VS Code, it looks for a top level `.vscode` folder with a `launch.json` file.

You can debug in the following ways:
* **Launch Program** - transpile typescript to javascript via npm build, then launch the app with the debugger attached on startup
* **Attach by Process ID** - run the project in debug mode. This is mostly identical to the "Node.js: Attach by Process ID" template with one minor change.
We added `"protocol": "inspector"` which tells VS Code that we're using the latest version of Node which uses a new debug protocol.
* **Jest Current File** - have a Jest test file open and active in VSCode, then debug this specific file by setting break point. All tests are not run.
* **Jest all** -  run all tests, set a break point.

In this file, you can tell VS Code exactly what you want to do:
```json
[
        {
            "name": "Launch Program",
            "type": "node",
            "program": "${workspaceFolder}/dist/server.js",
            "request": "launch",
            "preLaunchTask": "npm: build"
        },
        {
            "type": "node",
            "request": "attach",
            "name": "Attach by Process ID",
            "processId": "${command:PickProcess}",
            "protocol": "inspector"
        },
        {
            "type": "node",
            "request": "launch",
            "name": "Jest Current File",
            "program": "${workspaceFolder}/node_modules/.bin/jest",
            "args": [
                "${fileBasenameNoExtension}",
                "--detectOpenHandles"
            ],
            "console": "integratedTerminal",
            "internalConsoleOptions": "neverOpen",
            "disableOptimisticBPs": true,
            "windows": {
                "program": "${workspaceFolder}/node_modules/jest/bin/jest",
            }
        },
        {
            "type": "node",
            "request": "launch",
            "name": "Jest all",
            "runtimeExecutable": "npm",
            "runtimeArgs": [
                "run-script",
                "test"
            ],
            "port": 9229,
            "skipFiles": [
                "<node_internals>/**"
            ]
        },
    ]
```

With this file in place, you can hit `F5` to attach a debugger.
You will probably have multiple node processes running, so you need to find the one that shows `node dist/server.js`.
Now just set your breakpoints and go!

## Testing
For this project, I chose [Jest](https://facebook.github.io/jest/) as our test framework.
While Mocha is probably more common, Mocha seems to be looking for a new maintainer and setting up TypeScript testing in Jest is wicked simple.

### Install the components
To add TypeScript + Jest support, first install a few npm packages:
```
npm install -D jest ts-jest
```
`jest` is the testing framework itself, and `ts-jest` is just a simple function to make running TypeScript tests a little easier.

### Configure Jest
Jest's configuration lives in `jest.config.js`, so let's open it up and add the following code:
```js
module.exports = {
    globals: {
        'ts-jest': {
            tsconfigFile: 'tsconfig.json'
        }
    },
    moduleFileExtensions: [
        'ts',
        'js'
    ],
    transform: {
        '^.+\\.(ts|tsx)$': './node_modules/ts-jest/preprocessor.js'
    },
    testMatch: [
        '**/test/**/*.test.(ts|js)'
    ],
    testEnvironment: 'node'
};
```
Basically we are telling Jest that we want it to consume all files that match the pattern `"**/test/**/*.test.(ts|js)"` (all `.test.ts`/`.test.js` files in the `test` folder), but we want to preprocess the `.ts` files first.
This preprocess step is very flexible, but in our case, we just want to compile our TypeScript to JavaScript using our `tsconfig.json`.
This all happens in memory when you run the tests, so there are no output `.js` test files for you to manage.

### Running tests
Simply run `npm run test`.
Note this will also generate a coverage report.

### Writing tests
Writing tests for web apps has entire books dedicated to it and best practices are strongly influenced by personal style, so I'm deliberately avoiding discussing how or when to write tests in this guide.
However, if prescriptive guidance on testing is something that you're interested in, [let me know](https://www.surveymonkey.com/r/LN2CV82), I'll do some homework and get back to you.

# VSCode Extensions

To enhance your development experience while working in VSCode we also provide you a list of the suggested extensions for working with this project:

- [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [REST Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client)

# Contributions

To contribute to this project:
1. [Pre-requisites](#pre-requisites)
2. [Set up `.env` file](#)
    * Remove the `.example` from your `.env.example` file
    * Run the following code in your terminal
    ```sh
    node -e "console.log(require('crypto').randomBytes(64).toString('hex'))"
    ```
    Copy the output and paste it to your `.env` file to the `JWT_SECRET` variable and do the same for the `JWT_REFRESH_SECRET` .
    * Set a lifetime for your token expiration ex '7d' or '1h'.

    Your final `.env` file should look something like this :
    ```ts
    PORT = 8000
    MONGO_URL = 
    MONGO_URL_LOCAL = 'mongodb://127.0.0.1:27017/Animu?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+2.1.1'
    JWT_SECRET='f74a226d6fb2776299446356825684e8f131cb68feb391c8bd348fc682cd505e77f43748e1f242c0aa1fa1f2b8a7e3e6146fb285321c9b1be73b59b23c19117a'
    JWT_REFRESH_SECRET='268f5fbaa8569156bb9f3ba9c67ea964af8a38d05887557e49155d003e5cbdc92dae07629f3f4ad1667d1316399f4be4baaf91278ff5e0bd28afd7ef1419a564'
    JWT_LIFETIME='3h'
    ```
3. [Get Started](#getting-started)
4. You're done!

## License
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the [MIT](LICENSE) License.
