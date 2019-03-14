import * as debug from './debug';

const util = require('util');
const path = require('path');
const exec = util.promisify(require('child_process').exec);


export default {
    // Multiple browsers support
    isMultiBrowser: true,


    // Required - must be implemented
    // Browser control
    // eslint-disable-next-line no-unused-vars
    async openBrowser (id, pageUrl, browserName) {
        var browserString = this.determineValidBrowser(browserName);

        const xCodeProjLocation = path.join(__dirname, '/XCUITest/testApplication/testApplication.xcodeproj');
        const startXCTestCmd = 'xcodebuild -project ' + xCodeProjLocation + ' -scheme testApplication -destination \'' + browserString + '\' test TESTCAFE_URL=' + pageUrl;
        
        await debug.log('running openBrowser with url:' + pageUrl);
        await exec(startXCTestCmd);
    },

    determineValidBrowser (browserName) {
        //expects simulator.iphone.8
        var simulator = browserName.includes('simulator');
        
        if (simulator) {
            //first one is the simulator tag
            const deviceType = browserName.split('.')[1];
           
            return 'platform=iOS Simulator,name=' + deviceType;
        }

        //assume ios, UUID config
        return 'platform=ios,id=' + browserName;
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
