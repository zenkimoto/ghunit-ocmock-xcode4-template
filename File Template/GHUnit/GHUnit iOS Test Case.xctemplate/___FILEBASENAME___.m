//
//  ___PROJECTNAME___ - ___FILENAME___
//  Copyright ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  Created by: ___FULLUSERNAME___
//

#import <GHUnitIOS/GHUnit.h>

@interface ___FILEBASENAMEASIDENTIFIER___ : GHTestCase
{
    
}
@end

@implementation ___FILEBASENAMEASIDENTIFIER___

- (BOOL)shouldRunOnMainThread {
    // By default NO, but if you have a UI test or test dependent on running on the main thread return YES
    return NO;
}

- (void)setUpClass {
    // Run at start of all tests in the class
}

- (void)tearDownClass {
    // Run at end of all tests in the class
}

- (void)setUp {
    // Run before each test method
}

- (void)tearDown {
    // Run after each test method
}

- (void)testExample
{
    GHFail(@"Unit tests are not implemented yet in ___FILEBASENAMEASIDENTIFIER___");
}

@end
