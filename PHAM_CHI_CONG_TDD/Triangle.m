//
//  Triangle.m
//  PHAM_CHI_CONG_TDD
//
//  Created by TTA-Brown-006 on 4/14/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import "Triangle.h"


@implementation Triangle

- (TriangleType)calculateTriangleWithSlide1:(float)slide1Value slide2:(float)slide2Value slide3:(float)slide3Value {
    if (slide1Value <= 0 || slide2Value <= 0 || slide3Value <= 0) {
        [[TriangleException exceptionWithName:@"Triangle" reason:@"You input wrong value for each slide of triangle!" userInfo:nil] raise];
    }
    
    TriangleType triangleType = Scalene;
    if (slide1Value == slide2Value && slide1Value == slide3Value) {
        triangleType = Equilateral;
    }
    else if ((slide1Value == slide2Value) || (slide1Value == slide3Value) || (slide2Value == slide3Value)) {
        triangleType = Isosceles;
    }
    return triangleType;
}

@end
