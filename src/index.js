import * as debug from './debug';

const util = require('util');
const exec = util.promisify(require('child_process').exec);


export default {
    // Multiple browsers support
    isMultiBrowser: true,


    // Required - must be implemented
    // Browser control
    // eslint-disable-next-line no-unused-vars
    async openBrowser (id, pageUrl, browserName) {
        const startXCTestCmd = 'xcodebuild -project XCUITest/testApplication/testApplication.xcodeproj -scheme testApplication -destination \'platform=iOS Simulator,name=iPhone XR\' test TESTCAFE_URL=' + pageUrl;

        await debug.log('running openBrowser with url:' + pageUrl);
        await exec(startXCTestCmd);
    },

    async closeBrowser (/* id */) {
        throw new Error('Not implemented!');
    },


    // Optional - implement methods you need, remove other methods
    // Initialization
    async init () {
        return;
    },

    async dispose () {
        return;
    },

    
    // Browser names handling
    async getBrowserList () {
        throw new Error('Not implemented!');
    },

    async isValidBrowserName (/* browserName */) {
        return true;
    },
    

    // Extra methods
    async resizeWindow (/* id, width, height, currentWidth, currentHeight */) {
        this.reportWarning('The window resize functionality is not supported by the "idevice" browser provider.');
    },

    async takeScreenshot (/* id, screenshotPath, pageWidth, pageHeight */) {
        this.reportWarning('The screenshot functionality is not supported by the "idevice" browser provider.');
    }
};
