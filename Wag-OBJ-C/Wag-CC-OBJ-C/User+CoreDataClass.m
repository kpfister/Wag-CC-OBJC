//
//  User+CoreDataClass.m
//  Wag-CC-OBJ-C
//
//  Created by Karl Pfister on 3/4/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//
//

#import "User+CoreDataClass.h"

@implementation User

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
@end
