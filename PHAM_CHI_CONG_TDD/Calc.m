//
//  Calc.m
//  PHAM_CHI_CONG_TDD
//
//  Created by TTA-Brown-006 on 4/13/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import "Calc.h"

@implementation Calc

- (int)addWithFirstValue:(int)first secondValue:(int)second {
//    if (first != 0 && second != 0) {
//        return first + second;
//    }
//    if (second == 0) {
//        return first;
//    }
//    return second;
    
    //Refactoring 1
//    if (first != 0 && second != 0) {
//        return first + second;
//    }
//    if (second == 0) {
//        return first + second;
//    }
//    return second;
    
    //refactoring 2
    return first + second;
}

@end
