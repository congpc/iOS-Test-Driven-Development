//
//  ShopService.m
//  PHAM_CHI_CONG_TDD
//
//  Created by TTA-Brown-006 on 4/14/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import "ShopService.h"

@implementation ShopService
@synthesize authenticator;

- (BOOL)doLogin:(NSDictionary*)params {
    if (self.authenticator == nil) {
        return NO;
    }
    return [self.authenticator authenticateWithUsernam:params[@"uid"] password:params[@"pwd"]];
}

@end
