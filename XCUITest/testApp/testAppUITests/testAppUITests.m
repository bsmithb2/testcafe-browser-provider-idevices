//
//  testAppUITests.m
//  testAppUITests
//
//  Created by Bradley Smith on 9/3/19.
//  Copyright © 2019 Bradley Smith. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface testAppUITests : XCTestCase

@end

@implementation testAppUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    
    //XCUIApplication *app = [[XCUIApplication alloc] init];
    ///*@START_MENU_TOKEN@*/[[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element swipeRight];/*[["[[[","app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element","["," swipeUp];"," swipeRight];"],[[[0,1,1]],[[2,4],[2,3]]],[0,0]]@END_MENU_TOKEN@*/
    //[XCUIDevice sharedDevice].orientation = UIDeviceOrientationPortrait;
    //[XCUIDevice sharedDevice].
    //[app/*@START_MENU_TOKEN@*/.otherElements[@"AppSwitcherContentView"]/*[[".windows[@\"SBSwitcherWindow\"].otherElements[@\"AppSwitcherContentView\"]",".otherElements[@\"AppSwitcherContentView\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ tap];
    //[app/*@START_MENU_TOKEN@*/.pageIndicators[@"Page control"]/*[[".otherElements[@\"Home screen icons\"]",".otherElements[@\"SBFolderScalingView\"].pageIndicators[@\"Page control\"]",".pageIndicators[@\"Page control\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/ tap];
    //[XCUIDevice sharedDevice].orientation = UIDeviceOrientationPortrait;
    //[app/*@START_MENU_TOKEN@*/.icons[@"Safari"]/*[[".otherElements[@\"Home screen icons\"]",".otherElements[@\"SBFolderScalingView\"]",".otherElements[@\"Dock\"].icons[@\"Safari\"]",".icons[@\"Safari\"]"],[[[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/ tap];
    //[app/*@START_MENU_TOKEN@*/.otherElements[@"URL"]/*[[".otherElements[@\"BrowserWindow\"]",".buttons[@\"Address\"]",".otherElements[@\"Address\"]",".otherElements[@\"URL\"]",".buttons[@\"URL\"]"],[[[-1,3],[-1,2],[-1,4,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,4,2],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/ tap];
    
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    //[self goToSpringBoardFirstPage];
    //XCUIElementQuery *appElementsQuery = [[self descendantsMatchingType:XCUIElementTypeIcon] matchingIdentifier:identifier];
    //NSArray<XCUIElement *> *matchedAppElements = [appElementsQuery allElementsBoundByIndex];
    //if (0 == matchedAppElements.count) {
    //    XCTAssertTrue(false);
    //}
}

- (void) test2 {
    [[XCUIDevice sharedDevice] pressButton:XCUIDeviceButtonHome];
    XCUIApplication app = [[XCUIApplication alloc]    /*@START_MENU_TOKEN@*/.otherElements[@"Dock"].icons[@"Safari"]/*[[".otherElements[@\"Home screen icons\"]",".otherElements[@\"SBFolderScalingView\"]",".otherElements[@\"Dock\"].icons[@\"Safari\"]",".icons[@\"Safari\"]"],[[[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/ tap];
    
}

- (void) testAgain {
    
}

- (void)goToSpringBoardFirstPage
{
    [[XCUIDevice sharedDevice] pressButton:XCUIDeviceButtonHome];
    [[XCUIDevice sharedDevice] pressButton:XCUIDeviceButtonHome];
    [[XCUIDevice sharedDevice] pressButton:XCUIDeviceButtonHome];
    [[XCUIDevice sharedDevice] pressButton:XCUIDeviceButtonHome];
}

@end
