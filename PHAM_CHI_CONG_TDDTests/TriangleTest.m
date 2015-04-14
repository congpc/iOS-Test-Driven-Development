//
//  TriangleTest.m
//  PHAM_CHI_CONG_TDD
//
//  Created by TTA-Brown-006 on 4/14/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Triangle.h"

/*
 Todo list:
 - Input all slide = 0 - Output: Raise an exception
 - Input a slide = 0 and two slides != 0 - Output: Raise an exception
 - Input two slides = 0 and 1 slides != 0 - Output: Raise an exception
 - Input slide is negative value = -3. - Output: Raise an exception
 - Test an equilateral triangle. Input: three slides = 5 - Output: 1
 - Test an isosceles triangle. Input two slides = 4 and a slide = 5 - Output: 2
 - Test an scalene triangle. Input a slide = 3, a slide = 4, a slide = 5 - Output: 3
 - Test an equilateral triangle with float value. Input: three slides = 5.5 - Output: 1
 - Test an isosceles triangle with float value. Input two slides = 4.4 and a slide = 5.5 - Output: 2
 - Test an scalene triangle with float value. Input a slide = 3.1, a slide = 4.2, a slide = 5.3 - Output: 3
 */

@interface TriangleTest : XCTestCase {
    Triangle *_triangle;
}

@end

@implementation TriangleTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _triangle = [[Triangle alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    _triangle = nil;
}

- (void)testAllSlidesEqualZero {
    // Input all slide = 0
    XCTAssertThrowsSpecific([_triangle calculateTriangleWithSlide1:0 slide2:0 slide3:0], TriangleException, @"Occur exception !");
}

- (void)testOneSlideEqualZeroAndTwoSlidesNotEqualZero {
    // Input 1 slide = 0 and 2 slides != 0 - Output: Raise an exception
    XCTAssertThrowsSpecific([_triangle calculateTriangleWithSlide1:0 slide2:3 slide3:5], TriangleException, @"Occur exception !");
    
    XCTAssertThrowsSpecific([_triangle calculateTriangleWithSlide1:3 slide2:0 slide3:5], TriangleException, @"Occur exception !");
    
    XCTAssertThrowsSpecific([_triangle calculateTriangleWithSlide1:3 slide2:5 slide3:0], TriangleException, @"Occur exception !");
}

- (void)testTwoSlidesEqualZeroAndOneSlideNotEqualZero {
    // Input 2 slide = 0 and 1 slides != 0 - Output: Raise an exception
    XCTAssertThrowsSpecific([_triangle calculateTriangleWithSlide1:0 slide2:0 slide3:5], TriangleException, @"Occur exception !");
    
    XCTAssertThrowsSpecific([_triangle calculateTriangleWithSlide1:3 slide2:0 slide3:0], TriangleException, @"Occur exception !");
    
    XCTAssertThrowsSpecific([_triangle calculateTriangleWithSlide1:0 slide2:4 slide3:0], TriangleException, @"Occur exception !");
}

- (void)testNegativeValue {
    // Test negative value
    XCTAssertThrowsSpecific([_triangle calculateTriangleWithSlide1:-4 slide2:-4 slide3:-4], TriangleException, @"Occur exception !");
    
    XCTAssertThrowsSpecific([_triangle calculateTriangleWithSlide1:-4 slide2:4 slide3:4], TriangleException, @"Occur exception !");
}

- (void)testEquilateralTriangle {
    // Test an equilateral triangle. Input: 3 slide = 5 - Output: 1
    XCTAssertEqual(1, [_triangle calculateTriangleWithSlide1:5 slide2:5 slide3:5]);
    
    XCTAssertEqual(1, [_triangle calculateTriangleWithSlide1:6 slide2:6 slide3:6]);
}

- (void)testIsoscelesTriangle {
    // Test an isosceles triangle. Input 2 slide = 4 and 1 slide = 5 - Output: 2
    XCTAssertEqual(2, [_triangle calculateTriangleWithSlide1:5 slide2:4 slide3:5]);
    
    XCTAssertEqual(2, [_triangle calculateTriangleWithSlide1:4 slide2:5 slide3:5]);
    
    XCTAssertEqual(2, [_triangle calculateTriangleWithSlide1:5 slide2:5 slide3:4]);
}

- (void)testScaleneTriangle {
    // Test an scalene triangle. Input 1 slide = 3, 1 slide = 4, 1 slide = 5 - Output: 3
    XCTAssertEqual(3, [_triangle calculateTriangleWithSlide1:3 slide2:4 slide3:5]);
    
    XCTAssertEqual(3, [_triangle calculateTriangleWithSlide1:5 slide2:4 slide3:3]);
    
    XCTAssertEqual(3, [_triangle calculateTriangleWithSlide1:3 slide2:5 slide3:4]);
}

- (void)testEquilateralTriangleWithFloatValue {
    XCTAssertEqual(1, [_triangle calculateTriangleWithSlide1:5 slide2:5.0 slide3:5.0]);
    
    XCTAssertEqual(1, [_triangle calculateTriangleWithSlide1:5.5 slide2:5.5 slide3:5.5]);
}

- (void)testIsoscelesTriangleWithFloatValue {
    XCTAssertEqual(2, [_triangle calculateTriangleWithSlide1:5.5 slide2:5.5 slide3:4.5]);
    
    XCTAssertEqual(2, [_triangle calculateTriangleWithSlide1:5.5 slide2:4.5 slide3:5.5]);
    
    XCTAssertEqual(2, [_triangle calculateTriangleWithSlide1:4.5 slide2:5.5 slide3:5.5]);
}

- (void)testScaleneTriangleWithFloatValue {
    // Test an scalene triangle. Input 1 slide = 3, 1 slide = 4, 1 slide = 5 - Output: 3
    XCTAssertEqual(3, [_triangle calculateTriangleWithSlide1:3.3 slide2:4.2 slide3:5.7]);
    
    XCTAssertEqual(3, [_triangle calculateTriangleWithSlide1:5.5 slide2:4.3 slide3:3.7]);
    
    XCTAssertEqual(3, [_triangle calculateTriangleWithSlide1:3.3 slide2:5.3 slide3:4.3]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
