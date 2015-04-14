//
//  SortReservationList.m
//  PHAM_CHI_CONG_TDD
//
//  Created by TTA-Brown-006 on 4/14/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import "SortReservationList.h"

@implementation SortReservationList

- (id)init {
    if (self = [super init]) {
        _reservationList = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addReservation:(SortReservation*)reservation {
    [_reservationList addObject:reservation];
}

- (SortReservation*)retrieveReservationWithOrder:(int)order {
    return (SortReservation*)[_reservationList objectAtIndex:order];
}

- (void)sortedByDate {
    NSLog(@"Before:%@",_reservationList);
    [_reservationList sortUsingComparator:^NSComparisonResult(SortReservation *obj1, SortReservation *obj2) {
        return [obj1.reservationDate compare:obj2.reservationDate];
    }];
    NSLog(@"After:%@",_reservationList);
}

- (void)sortedByNumber {
    [_reservationList sortUsingComparator:^NSComparisonResult(SortReservation *obj1, SortReservation *obj2) {
        return obj1.number - obj2.number;
    }];
}

- (void)sortByDepartureAndNumber {
    NSLog(@"Before:%@",_reservationList);
    [_reservationList sortUsingComparator:^NSComparisonResult(SortReservation *obj1, SortReservation *obj2) {
        int result = [obj1.reservationDate compare:obj2.reservationDate];
        if (result == 0) {
            return obj2.number - obj1.number;
        }
        return result;
    }];
    NSLog(@"After:%@",_reservationList);
}


@end
