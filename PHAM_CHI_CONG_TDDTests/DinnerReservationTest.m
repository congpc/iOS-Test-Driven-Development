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
#import "CourseOrder.h"

/*
 Basic Specification:
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

/*
 Advance 1 Specification:
 What if multiple courses are ordered in one party? 􏰁 e.g.) 3 users for Matsu and 10 users for Take
 􏰀 Make it possible to set users by courses.
 
 Todo list:
 - Multiple courses
 - Add one course
 - Use NSMutableDictionary
 - Add same courses
 */

/*
 Advance 2 Specification:
 It was decided each course has three variations of Japanese, Western, and Chinese.
 􏰁 However, Chinese exists only in Matsu course, and extra charge of 500yen is needed.
 
 Todo list:
 - Japanese/Western/Chinese
 - Error when Chinese and Take/Ume 
 - Charge When Chinese and Matsu
 - Course order
 - Create method
 - Change calculation method
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

#pragma mark --- Basic ---
//- (void)testMatsu {
//    // Calculate price(Matsu)
//    [_dinnerReservation setUser:10];
//    [_dinnerReservation setCourse:1];
//    XCTAssertEqual(70000, [_dinnerReservation getCharge]);
//}
//
//- (void)testTake {
//    // Calculate price(Take)
//    [_dinnerReservation setUser:10];
//    [_dinnerReservation setCourse:2];
//    XCTAssertEqual(50000, [_dinnerReservation getCharge]);
//}
//
//- (void)testUme {
//    // Calculate price (Ume)
//    [_dinnerReservation setUser:10];
//    [_dinnerReservation setCourse:3];
//    XCTAssertEqual(30000, [_dinnerReservation getCharge]);
//}
//
//- (void)testCoupon {
//    // When coupons are used
//    [_dinnerReservation setUser:10];
//    [_dinnerReservation setCourse:Matsu];
//    [_dinnerReservation setCoupon:1];
//    XCTAssertEqual(60000, [_dinnerReservation getCharge]);
//}
//
//- (void)testCouponException {
//    XCTAssertThrowsSpecific([_dinnerReservation setCoupon:4], CouponException, @"3 coupons limit");
//}


#pragma mark --- Advance 1 ---
//- (void)testAddTwoCourse {
//    [_dinnerReservation addCourseWithUser:3 course:Matsu];
//    [_dinnerReservation addCourseWithUser:10 course:Take];
//    XCTAssertEqual(71000, [_dinnerReservation getCharge]);
//    
//}
//
//- (void)testAddOneCourse {
//    [_dinnerReservation addCourseWithUser:10 course:Matsu];
//    XCTAssertEqual(70000, [_dinnerReservation getCharge]);
//}
//
//- (void)testMatsu {
//    // Calculate price(Matsu)
//    [_dinnerReservation addCourseWithUser:10 course:Matsu];
//    XCTAssertEqual(70000, [_dinnerReservation getCharge]);
//}
//
//- (void)testTake {
//    // Calculate price(Take)
//    [_dinnerReservation addCourseWithUser:10 course:Take];
//    XCTAssertEqual(50000, [_dinnerReservation getCharge]);
//}
//
//- (void)testUme {
//    // Calculate price (Ume)
//    [_dinnerReservation addCourseWithUser:10 course:Ume];
//    XCTAssertEqual(30000, [_dinnerReservation getCharge]);
//}
//
//- (void)testCoupon {
//    // When coupons are used
//    [_dinnerReservation addCourseWithUser:10 course:Matsu];
//    [_dinnerReservation setCoupon:1];
//    XCTAssertEqual(60000, [_dinnerReservation getCharge]);
//}
//
//- (void)testAddSameCourses {
//    [_dinnerReservation addCourseWithUser:2 course:Matsu];
//    [_dinnerReservation addCourseWithUser:3 course:Matsu];
//    XCTAssertEqual(21000, [_dinnerReservation getCharge]);
//}

#pragma mark --- Advance 2 ---
- (void)testMatsu {
    // Calculate price(Matsu)
//    CourseOrder *order = [[CourseOrder alloc] init];
//    [order setUser:10];
//    [order setCourse:Matsu];
    
    CourseOrder *order = [CourseOrder createMatsuCourseWithUser:10];
    [_dinnerReservation addCourseOrder:order];
    XCTAssertEqual(70000, [_dinnerReservation getCharge]);
}

- (void)testTake {
    CourseOrder *order = [CourseOrder createTakeCourseWithUser:10];
    [_dinnerReservation addCourseOrder:order];
    XCTAssertEqual(50000, [_dinnerReservation getCharge]);
}

- (void)testUme {
    CourseOrder *order = [CourseOrder createUmeCourseWithUser:10];
    [_dinnerReservation addCourseOrder:order];
    XCTAssertEqual(30000, [_dinnerReservation getCharge]);
}

- (void)testCoupon {
    CourseOrder *order = [CourseOrder createMatsuCourseWithUser:10];
    [_dinnerReservation addCourseOrder:order];
    [_dinnerReservation setCoupon:1];
    XCTAssertEqual(60000, [_dinnerReservation getCharge]);
}

- (void)testAddTwoCourse {
    CourseOrder *order = [CourseOrder createMatsuCourseWithUser:3];
    [_dinnerReservation addCourseOrder:order];
    CourseOrder *order2 = [CourseOrder createTakeCourseWithUser:10];
    [_dinnerReservation addCourseOrder:order2];
    XCTAssertEqual(71000, [_dinnerReservation getCharge]);

}

- (void)testAddSameCourses {
    CourseOrder *order = [CourseOrder createMatsuCourseWithUser:2];
    [_dinnerReservation addCourseOrder:order];
    CourseOrder *order2 = [CourseOrder createMatsuCourseWithUser:3];
    [_dinnerReservation addCourseOrder:order2];
    XCTAssertEqual(21000, [_dinnerReservation getCharge]);
}

- (void)testStyle {
    CourseOrder *order = [CourseOrder createMatsuCourseWithUser:10];
    [order setStyle:Japanese];
    [_dinnerReservation addCourseOrder:order];
    XCTAssertEqual(70000, [_dinnerReservation getCharge]);
}

- (void)testValidation {
    CourseOrder *order = [CourseOrder createTakeCourseWithUser:10];
    [order setStyle:Chinese];
    XCTAssertFalse([order isValid],@"False is right");
    
    order = [CourseOrder createUmeCourseWithUser:10];
    [order setStyle:Chinese];
    XCTAssertFalse([order isValid],@"False is right");
    
    order = [CourseOrder createMatsuCourseWithUser:10];
    [order setStyle:Chinese];
    XCTAssertTrue([order isValid],@"True is right");
}

- (void)testAdditionalCharge {
    CourseOrder *order = [CourseOrder createMatsuCourseWithUser:10];
    [order setStyle:Chinese];
    [_dinnerReservation addCourseOrder:order];
    XCTAssertEqual(75000, [_dinnerReservation getCharge]);
}

#pragma mark --- Performance ---
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
