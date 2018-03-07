//
//  UserClass.m
//  Wag-CC-OBJ-C
//
//  Created by Karl Pfister on 3/2/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

#import "UserClass.h"
#import "User+CoreDataClass.h"
#import "AppDelegate.h"
@import CoreData;

@implementation UserClass


-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        // Init UserClass Objects with the values from dict

        self.name = dict[@"display_name"];
        self.avatarImageString = dict[@"profile_image"];
        self.badges = dict[@"badge_counts"];
        self.goldBadgeCount = [self.badges[@"gold"]stringValue];
        self.silverBadgeCount = [self.badges[@"silver"]stringValue];
        self.bronzeBadgeCount = [self.badges[@"bronze"]stringValue];
        //self.avatarImage = [self.avatarImage];
        
        
    }
    return self;
}

 ///I want to create a convience initializer for when I am creating my users from the JSON dictionary. This, as I understand, will help me avoid any nil value issues.

@end

