//
//  CalcTest.m
//  PHAM_CHI_CONG_TDD
//
//  Created by TTA-Brown-006 on 4/13/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Calc.h"

/*
 Todo list:
 - Both numbers are zero.
 - Only first number is zero.
 - Only second number is zero.
 - Neither is zero.
 */

@interface CalcTest : XCTestCase {
    Calc *_calc;
}

@end

@implementation CalcTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _calc = [[Calc alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    _calc = nil;
}

- (void)testBothZero {
    // Both numbers are zero.
    XCTAssertEqual(0, [_calc addWithFirstValue:0 secondValue:0]);
}

- (void)testFirstZero {
    // Only first number is zero.
    XCTAssertEqual(3, [_calc addWithFirstValue:0 secondValue:3]);
}

- (void)testSecondZero {
    // Only second number is zero.
    XCTAssertEqual(2, [_calc addWithFirstValue:2 secondValue:0]);
}

- (void)testBothNotZero {
    // Neither is zero.
    XCTAssertEqual(5, [_calc addWithFirstValue:2 secondValue:3]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
