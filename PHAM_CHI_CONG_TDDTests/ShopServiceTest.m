//
//  ShopServiceTest.m
//  PHAM_CHI_CONG_TDD
//
//  Created by TTA-Brown-006 on 4/14/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ShopService.h"
#import "NotNullAuthenticator.h"

/*Todo list:
 - Authenticate with ID and password
 - Create a mock
 */

@interface ShopServiceTest : XCTestCase {
    ShopService *_service;
}

@end

@implementation ShopServiceTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _service = [[ShopService alloc] init];
    [_service setAuthenticator:[[NotNullAuthenticator alloc] init]];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLoginSuccess {
    // Login success
    BOOL result = [_service doLogin:@{@"action":@"auth",@"uid":@"aaa",@"pwd":@"p123"}]; //@"p123"
    XCTAssertTrue(result);
}

@end
