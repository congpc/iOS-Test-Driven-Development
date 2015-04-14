//
//  SortReservationListTest.m
//  PHAM_CHI_CONG_TDD
//
//  Created by TTA-Brown-006 on 4/14/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "SortReservation.h"
#import "SortReservationList.h"

/*
 Todo list:
 - No sort
 - Ascendant by date 
 - Descendant by number
 - Ascendant by date, descendant by num
 */

@interface SortReservationListTest : XCTestCase {
    SortReservationList *_list;
    SortReservation *_res1;
    SortReservation *_res2;
}

@end

@implementation SortReservationListTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _list = [[SortReservationList alloc] init];
    _res1 = [[SortReservation alloc] init];
    [_res1 setCustomerName:@"Sato"];
    [_res1 setCourseName:@"Chef recommend"];
    [_res1 setReservationDate:@"2010.11.24"];
    [_res1 setNumber:2];
    [_list addReservation:_res1];
    
    _res2 = [[SortReservation alloc] init];
    [_res2 setCustomerName:@"Suzuki"];
    [_res2 setCourseName:@"Session vegetable"];
    [_res2 setReservationDate:@"2010.11.20"];
    [_res2 setNumber:3];
    [_list addReservation:_res2];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    _list = nil;
    _res1 = nil;
    _res2 = nil;
    [super tearDown];
}

- (void)testUnsortToList {
    // Unsort test case
    SortReservation *result = [_list retrieveReservationWithOrder:0];
    XCTAssertEqual(_res1, result);
    result = [_list retrieveReservationWithOrder:1];
    XCTAssertEqual(_res2, result);
}

- (void)testSortByDate {
    // Sort by date
    [_list sortedByDate];
    SortReservation *result = [_list retrieveReservationWithOrder:0];
    XCTAssertEqual(_res2, result);
    result = [_list retrieveReservationWithOrder:1];
    XCTAssertEqual(_res1, result);
}

- (void)testSortByNumber {
    // Sort by date
    [_list sortedByNumber];
    SortReservation *result = [_list retrieveReservationWithOrder:0];
    XCTAssertEqual(_res1, result);
    result = [_list retrieveReservationWithOrder:1];
    XCTAssertEqual(_res2, result);
}

- (void)testSortByDepartureAndDate {
    // Sort by date
    [_list sortByDepartureAndNumber];
    SortReservation *result = [_list retrieveReservationWithOrder:0];
    XCTAssertEqual(_res2, result);
    result = [_list retrieveReservationWithOrder:1];
    XCTAssertEqual(_res1, result);
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
