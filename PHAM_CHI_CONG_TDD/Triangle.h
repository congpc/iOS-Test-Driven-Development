//
//  Triangle.h
//  PHAM_CHI_CONG_TDD
//
//  Created by TTA-Brown-006 on 4/14/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TriangleException.h"

typedef enum {
    None = 0,
    Equilateral = 1,
    Isosceles = 2,
    Scalene = 3,
} TriangleType;

@interface Triangle : NSObject

- (TriangleType)calculateTriangleWithSlide1:(float)slide1Value slide2:(float)slide2Value slide3:(float)slide3Value;

@end
