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

A 'browser' is the device you'd like to test in this case. For simulators use "simulator.{simulator Name}"

eg testcafe 'idevice:simulator.iphone 8' 'path/to/test/file.js'

You can find your simulators using

```
xcrun simctl list
```

When you run on a real device, you require a few steps. 
1. Install XCode
2. Open the XCUITest testApplication. 
3. Select your team (Personal is fine). Make sure you do both targets (There's a little dropdown)
4. Run the app
5. Run the test in XCode. Note that the test will fail if you have a code to lock your phone. Remove it, and set your phone to stay unlocked forever. Its a test device. 
6. Run your tests. Make sure the testcafe server (your mac) and the device are accessible and on the same network as each other. If you can't connect then the browser will open, but nothing will load. 

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
