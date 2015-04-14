//
//  CourseOrder.m
//  PHAM_CHI_CONG_TDD
//
//  Created by TTA-Brown-006 on 4/13/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import "CourseOrder.h"

@implementation CourseOrder
@synthesize user = _user;
@synthesize course = _course;
@synthesize style = _style;

+ (CourseOrder*)createMatsuCourseWithUser:(int)userNumber {
    CourseOrder *order = [[CourseOrder alloc] init];
    order.user = userNumber;
    order.course = Matsu;
    return order;
}

+ (CourseOrder*)createTakeCourseWithUser:(int)userNumber {
    CourseOrder *order = [[CourseOrder alloc] init];
    order.user = userNumber;
    order.course = Take;
    return order;
}

+ (CourseOrder*)createUmeCourseWithUser:(int)userNumber {
    CourseOrder *order = [[CourseOrder alloc] init];
    order.user = userNumber;
    order.course = Ume;
    return order;
}

- (int)_getPrice:(Course)course {
    switch (course) {
        case Matsu: {
            if (_style == Chinese) {
                return 7500;
            }
            return 7000;
        }
        case Take:
            return 5000;
        case Ume:
            return 3000;
        default:
            return 0;
    }
}

- (BOOL)isValid {
    BOOL result = YES;
    if (_style == Chinese && _course != Matsu) {
        result = NO;
    }
    return result;
}

- (int)getOrderCharge {
    int price = [self _getPrice:_course];
    return price * _user;
}
@end
