//
//  DinnerReservation.m
//  PHAM_CHI_CONG_TDD
//
//  Created by TTA-Brown-006 on 4/13/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import "DinnerReservation.h"
#import "CouponException.h"

//Private
@interface DinnerReservation() {
    @private
    Course _number;
    int _course;
    int _coupon;
}

@end

@implementation DinnerReservation

- (void)setUser:(int)user {
    _number = user;
}

- (void)setCourse:(Course)course {
    _course = course;
}

- (void)setCoupon:(int)coupon {
    if (coupon > 3) {
        [[CouponException exceptionWithName:@"Coupon" reason:@"Limit 3 coupon" userInfo:nil] raise];
        return;
    }
    _coupon = coupon;
}

- (int)_getPrice:(Course)course {
    switch (_course) {
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

- (int)getCharge {
    int price = [self _getPrice:_course];
    return (price * _number) - (10000 * _coupon);
}

@end
