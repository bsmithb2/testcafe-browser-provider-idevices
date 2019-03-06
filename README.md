# testcafe-browser-provider-idevice
[![Build Status](https://travis-ci.org/bsmithb2/testcafe-browser-provider-idevice.svg)](https://travis-ci.org/bsmithb2/testcafe-browser-provider-idevice)

This is the **idevice** browser provider plugin for [TestCafe](http://devexpress.github.io/testcafe).

## Install

```
npm install testcafe-browser-provider-idevice
```

## Usage


You can determine the available browser aliases by running
```
testcafe -b idevice
```

When you run tests from the command line, use the alias when specifying browsers:

```
testcafe idevice:browser1 'path/to/test/file.js'
```


When you use API, pass the alias to the `browsers()` method:

```js
testCafe
    .createRunner()
    .src('path/to/test/file.js')
    .browsers('idevice:browser1')
    .run();
```

## Author
Bradley Smith (https://bradley-smith.dev)
