# testcafe-browser-provider-idevice
[![Build Status](https://dev.azure.com/BradleySmith0287/testcafe-browser-provider-android/_apis/build/status/bsmithb2.testcafe-browser-provider-android?branchName=master)](https://dev.azure.com/BradleySmith0287/testcafe-browser-provider-android/_build/latest?definitionId=1&branchName=master)

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

A 'browser' is the device you'd like to test in this case. For simulators use "simulator.(idevicetype).(model)"

eg testcafe idevice:simulator.iphone.8 'path/to/test/file.js'


When you use API, pass the alias to the `browsers()` method:

```js
testCafe
    .createRunner()
    .src('path/to/test/file.js')
    .browsers('idevice:browser1')
    .run();
```

## Author
Bradley Smith (https://bradleysmith.dev)
