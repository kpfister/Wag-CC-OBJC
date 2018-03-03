//
//  UserClass.h
//  Wag-CC-OBJ-C
//
//  Created by Karl Pfister on 3/2/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserClass : NSObject

// Place my Public properties here

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *avatarImageString;
@property (nonatomic, copy) NSString *bronzeBadgeCount;
@property (nonatomic, copy) NSString *silverBadgeCount;
@property (nonatomic, copy) NSString *goldBadgeCount;

-(instancetype)initWithUser:(NSString *)name
          avatarImageString:(NSString *)avatarImageString
           bronzeBadgeCount:(NSString *)bronzeBadgeCount
           silverBadgeCount:(NSString *)silverBadgeCount
             goldBadgeCount:(NSString *)goldBadgeCount;



/*
 Objectve C Method name Syntax
 
 Instance Method (-) ( return type ) method name Part : (paramater type) paramater name
 or Class Method (+)
 */

@end