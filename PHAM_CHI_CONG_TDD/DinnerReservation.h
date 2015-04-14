//
//  DinnerReservation.h
//  PHAM_CHI_CONG_TDD
//
//  Created by TTA-Brown-006 on 4/13/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CourseOrder;

typedef enum {
    Matsu = 1,
    Take = 2,
    Ume = 3
} Course;

@interface DinnerReservation : NSObject

//- (void)setUser:(int)user;
//- (void)setCourse:(Course)course;
- (void)setCoupon:(int)coupon;
- (int)getCharge;

//- (void)addCourseWithUser:(int)user course:(Course)course;

- (void)addCourseOrder:(CourseOrder*)courseOrder;

@end
