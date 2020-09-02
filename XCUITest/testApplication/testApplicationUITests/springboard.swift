//
//  Springboard.swift
//  https://gist.github.com/KoCMoHaBTa/5d2cecfc17db5f3944bc98bcd6fcde55
//
//  Created by Milen Halachev on 2/15/17.
//  Copyright © 2017 Milen Halachev. All rights reserved.
//

import Foundation
import XCTest

class Springboard {
    
    static let shared = Springboard()
    
    let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
    let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
    let settings = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
    
   
    fileprivate func goToSettingsHome(_ settings: XCUIApplication) {
        Thread.sleep(forTimeInterval: 1.0)
        var count = settings.navigationBars.buttons.count;
        var backButton = settings.navigationBars.buttons.element(boundBy: 0)
        if backButton.exists {
            Thread.sleep(forTimeInterval: 0.5)
            backButton.tap()
        }
        Thread.sleep(forTimeInterval: 1.0)
        count = settings.navigationBars.buttons.count;
        backButton = settings.navigationBars.buttons.element(boundBy: 0)
        Thread.sleep(forTimeInterval: 0.5)
        if backButton.exists {
            Thread.sleep(forTimeInterval: 0.5)
            backButton.tap()
        }
    }
    
    fileprivate func goHomeAndLoadSettings(_ settingsIcon: XCUIElement) {
        //Press home button twise slowly in order to go to the first page of the springboard
        Thread.sleep(forTimeInterval: 0.5)
        XCUIDevice.shared.press(.home)
        
        //Press home button twise slowly in order to go to the first page of the springboard
        Thread.sleep(forTimeInterval: 0.5)
        XCUIDevice.shared.press(.home)
        //tap the settings icon
        Thread.sleep(forTimeInterval: 0.5)
        settingsIcon.tap()
        goToSettingsHome(settings)
    }
    
    func resetLocationAndPrivacySettings() {
        XCUIDevice.shared.press(.home)
        Thread.sleep(forTimeInterval: 2.5)
        let settingsIcon = springboard.icons["Settings"]
        if settingsIcon.exists {
            let settings = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
            settings.terminate()
            goHomeAndLoadSettings(settingsIcon)
            //go to `General` -> `Reset` and tap `Reset Location & Privacy`
            settings.tables.staticTexts["General"].tap()
            settings.tables.staticTexts["Reset"].tap()
            settings.tables.staticTexts["Reset Location & Privacy"].tap()
            
            //tap the `Reset Warnings` button
            
            Thread.sleep(forTimeInterval: 0.5)
            if settings.buttons.count != 3 {
                print("A problem occurred trying to reset your location and privacy settings. This is probably because you have a lock code.")
                //hit the cancel button
                let count = settings.navigationBars.buttons.count;
                let backButton = settings.navigationBars.buttons.element(boundBy: 0)
                Thread.sleep(forTimeInterval: 0.5)
                if backButton.exists {
                    Thread.sleep(forTimeInterval: 0.5)
                    backButton.tap()
                }
            }
            else {
                settings.buttons["Reset Warnings"].tap()
            }
            resetBrowserSettings()
            settings.terminate()
        }
        
    }
    
    func openSafari(url: String) {
        XCUIDevice.shared.press(.home)
        let safariIcon = springboard.icons["Safari"]
        if safariIcon.exists {
            safariIcon.tap()
            Thread.sleep(forTimeInterval: 1.5)
            let safari2 = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
            if(safari2.buttons["Continue"].exists) {
                safari2.buttons["Continue"].tap()
            }
            
            print("Going to check URL button exists")
            if(safari.buttons["URL"].exists) {
                print("Going to tap URL button")
                safari2.buttons["URL"].tap()
            }
            Thread.sleep(forTimeInterval: 0.5)
            safari2.typeText(url + "\n")
            Thread.sleep(forTimeInterval: 5)
        }
    }
    
    func resetBrowserSettings() {
        goToSettingsHome(settings)
        settings.tables.staticTexts["Safari"].tap()
        Thread.sleep(forTimeInterval: 0.5)
        settings.tables.staticTexts["Clear History and Website Data"].tap()
        settings.buttons["Clear History and Data"].tap()
    }
}


