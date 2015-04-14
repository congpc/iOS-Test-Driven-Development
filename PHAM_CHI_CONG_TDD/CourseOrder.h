//
//  CourseOrder.h
//  PHAM_CHI_CONG_TDD
//
//  Created by TTA-Brown-006 on 4/13/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DinnerReservation.h"

typedef enum {
    Japanese = 1,
    Western = 2,
    Chinese = 3
} CourseStyle;

@interface CourseOrder : NSObject {
    
}
@property (nonatomic, assign) int user;
@property (nonatomic, assign) Course course;
@property (nonatomic, assign) CourseStyle style;

+ (CourseOrder*)createMatsuCourseWithUser:(int)userNumber;
+ (CourseOrder*)createTakeCourseWithUser:(int)userNumber;
+ (CourseOrder*)createUmeCourseWithUser:(int)userNumber;

- (BOOL)isValid;
- (int)getOrderCharge;

@end
