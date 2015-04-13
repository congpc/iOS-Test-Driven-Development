//
//  DinnerReservationTest.m
//  PHAM_CHI_CONG_TDD
//
//  Created by TTA-Brown-006 on 4/13/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "DinnerReservation.h"
#import "CouponException.h"
/*
 Requirements:
 You make the component to calculate price for the party when entered number of participant and the course.
 􏰀 There three courses Matsu(7,000yen), Take(5,000yen), and Ume(3,000yen).
 􏰀 Course price times number of participants becomes the price of the party.
 􏰀 There is a coupon to discount 10,000yen from the price of party.
 􏰀 Three coupons can be used at the same time.
 
 Todo list:
 - Calculate price(Matsu)
 - When coupons are used 
 - 3 coupons limit
 - Calculate price(Take) 
 - Calculate price (Ume)
 - Course constants 
 - Method for unit price
 */

@interface DinnerReservationTest : XCTestCase {
    DinnerReservation *_dinnerReservation;
}

@end

@implementation DinnerReservationTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _dinnerReservation = [[DinnerReservation alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    _dinnerReservation = nil;
}

- (void)testMatsu {
    // Calculate price(Matsu)
    [_dinnerReservation setUser:10];
    [_dinnerReservation setCourse:1];
    XCTAssertEqual(70000, [_dinnerReservation getCharge]);
}

- (void)testTake {
    // Calculate price(Take)
    [_dinnerReservation setUser:10];
    [_dinnerReservation setCourse:2];
    XCTAssertEqual(50000, [_dinnerReservation getCharge]);
}

- (void)testUme {
    // Calculate price (Ume)
    [_dinnerReservation setUser:10];
    [_dinnerReservation setCourse:3];
    XCTAssertEqual(30000, [_dinnerReservation getCharge]);
}

- (void)testCoupon {
    // When coupons are used
    [_dinnerReservation setUser:10];
    [_dinnerReservation setCourse:Matsu];
    [_dinnerReservation setCoupon:1];
    XCTAssertEqual(60000, [_dinnerReservation getCharge]);
}


- (void)testCouponException {
    XCTAssertThrowsSpecific([_dinnerReservation setCoupon:4], CouponException, @"");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
