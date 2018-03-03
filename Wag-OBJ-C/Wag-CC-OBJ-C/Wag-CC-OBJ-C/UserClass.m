//
//  UserClass.m
//  Wag-CC-OBJ-C
//
//  Created by Karl Pfister on 3/2/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

#import "UserClass.h"

@implementation UserClass

-(instancetype)initWithUser:(NSString *)name avatarImageString:(NSString *)avatarImageString bronzeBadgeCount:(NSString *)bronzeBadgeCount silverBadgeCount:(NSString *)silverBadgeCount goldBadgeCount:(NSString *)goldBadgeCount {
    self = [super init];
    if (self) {
        self.name = name;
        self.avatarImageString = avatarImageString;
        self.bronzeBadgeCount = bronzeBadgeCount;
        self.silverBadgeCount = silverBadgeCount;
        self.goldBadgeCount = goldBadgeCount;
    }
    return self;
}



 ///I want to create a convience initializer for when I am creating my users from the JSON dictionary. This, as I understand, will help me avoid any nil value issues.

//-(instancetype)initUser:(NSString*)name; {
//    if ((self = [super init])) {
//        self.name = name;
//    }
//}
@end
