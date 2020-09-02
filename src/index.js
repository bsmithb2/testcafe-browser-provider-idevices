import * as debug from './debug';

const path = require('path');
const { spawn } = require('child_process');


export default {
    // Multiple browsers support
    isMultiBrowser: true,


    // Required - must be implemented
    // Browser control
    // eslint-disable-next-line no-unused-vars
    async openBrowser (id, pageUrl, browserName) {
        var browserString = this.determineValidBrowser(browserName);

        const xCodeProjLocation = path.join(__dirname, '/XCUITest/testApplication/testApplication.xcodeproj');
        const startXCTestCmd = 'xcodebuild';
        const paramsXCTest = []; 
        
        paramsXCTest.push('-project');
        paramsXCTest.push(xCodeProjLocation); 
        paramsXCTest.push('-scheme');
        paramsXCTest.push('testApplication');
        paramsXCTest.push('-destination');
        paramsXCTest.push(browserString);
        paramsXCTest.push('test'); 
        paramsXCTest.push('TESTCAFE_URL=' + pageUrl);
        
        await debug.log('running openBrowser with url:' + pageUrl);
        const subProcess = spawn(startXCTestCmd, paramsXCTest,
            { stdio: ['ignore', process.stdout, process.stderr] } );
            
        subProcess.on('close', (code, signal) => { 
            debug.log('close: code:' + code + ' signal:' + signal); 
            //subProcess.disconnect();
            subProcess.kill();
        })
        .on('exit', (code, signal) => { 
            debug.log('exit: code:' + code + ' signal:' + signal); 
        })
        .on('error', (code, signal) => { 
            debug.log('error: code:' + code + ' signal:' + signal); 
        })
        .on('disconnect', (code, signal) => { 
            debug.log('disconnect: code:' + code + ' signal:' + signal); 
        })
        .on('message', (code, signal) => { 
            debug.log('message: code:' + code + ' signal:' + signal); 
        });

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
