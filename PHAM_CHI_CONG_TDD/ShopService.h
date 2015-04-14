//
//  ShopService.h
//  PHAM_CHI_CONG_TDD
//
//  Created by TTA-Brown-006 on 4/14/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Authenticator.h"

@interface ShopService : NSObject {
    
}
@property (nonatomic, retain, readwrite) id authenticator;

- (BOOL)doLogin:(NSDictionary*)params;

@end
