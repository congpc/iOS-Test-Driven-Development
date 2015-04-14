//
//  Authenticator.h
//  PHAM_CHI_CONG_TDD
//
//  Created by TTA-Brown-006 on 4/14/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

//This is an interface of objective C
@protocol Authenticator <NSObject>
- (BOOL)authenticateWithUsernam:(NSString*)username password:(NSString*)password;
@end
