//
//  SortReservationList.h
//  PHAM_CHI_CONG_TDD
//
//  Created by TTA-Brown-006 on 4/14/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SortReservation.h"

@interface SortReservationList : NSObject {
    @private
    NSMutableArray *_reservationList;
}

- (void)addReservation:(SortReservation*)reservation;
- (SortReservation*)retrieveReservationWithOrder:(int)order;

- (void)sortedByDate;
- (void)sortedByNumber;
- (void)sortByDepartureAndNumber;

@end
