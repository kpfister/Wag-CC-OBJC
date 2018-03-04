//
//  UserClass.m
//  Wag-CC-OBJ-C
//
//  Created by Karl Pfister on 3/2/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

#import "UserClass.h"

@implementation UserClass


-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        //[self setValuesForKeysWithDictionary:dict];
        self.name = dict[@"display_name"];
        self.avatarImageString = dict[@"profile_image"];
        self.badges = dict[@"badge_counts"];
        self.goldBadgeCount = self.badges[@"gold"];
       self.silverBadgeCount = self.badges[@"silver"];
        self.bronzeBadgeCount = self.badges[@"bronze"];
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
