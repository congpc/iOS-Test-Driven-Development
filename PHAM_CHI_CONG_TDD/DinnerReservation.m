//
//  DinnerReservation.m
//  PHAM_CHI_CONG_TDD
//
//  Created by TTA-Brown-006 on 4/13/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import "DinnerReservation.h"
#import "CouponException.h"
#import "CourseOrder.h"

//Private
@interface DinnerReservation() {
    @private
    //Basic
    Course _number;
    int _course;
    int _coupon;
    
    //Advance 1
    NSMutableDictionary *_courseTable;
}

@end

@implementation DinnerReservation

- (id)init {
    if (self = [super init]) {
        _courseTable = [[NSMutableDictionary alloc] init];
    }
    return self;
}

#pragma mark --- Private methods ---
- (int)_getPrice:(Course)course {
    switch (course) {
        case Matsu:
            return 7000;
        case Take:
            return 5000;
        case Ume:
            return 3000;
        default:
            return 0;
    }
}

#pragma mark --- Basic ---
//For Basic TDD
//- (void)setUser:(int)user {
//    _number = user;
//}
//
//- (void)setCourse:(Course)course {
//    _course = course;
//}
//
- (void)setCoupon:(int)coupon {
    if (coupon > 3) {
        [[CouponException exceptionWithName:@"Coupon" reason:@"Limit 3 coupon" userInfo:nil] raise];
        return;
    }
    _coupon = coupon;
}
//
//- (int)getCharge {
//    int price = [self _getPrice:_course];
//    return (price * _number) - (10000 * _coupon);
//}

#pragma mark --- Advance 1 ---
//For Advance 1 TDD
//- (void)addCourseWithUser:(int)user course:(Course)course {
//    [_courseTable addEntriesFromDictionary:@{@(course):@(user)}]; // key by NSNumber: value by NSNumber
//}

//- (int)getCharge {
//    int charge = 0;
//    for (NSNumber *key in _courseTable) {
//        Course course = (Course)[key intValue];
//        int price = [self _getPrice:course];
//        int number = [(_courseTable[key]) intValue];
//        charge += price * number;
//        
//    }
//    return charge - 10000 * _coupon;
//}

#pragma mark --- Advance 2 ---
- (void)addCourseOrder:(CourseOrder*)courseOrder {
//    [_courseTable addEntriesFromDictionary:@{@(courseOrder.course):@(courseOrder.user)}];
    [_courseTable addEntriesFromDictionary:@{@(courseOrder.course):courseOrder}]; // key by NSNumber: value by CourseOrder
}
- (int)getCharge {
    int charge = 0;
    for (NSString *key in _courseTable) {
        CourseOrder *order = (CourseOrder*)[_courseTable objectForKey:key];
        charge += order.getOrderCharge;
    }
    return charge - 10000 * _coupon;
}


@end
