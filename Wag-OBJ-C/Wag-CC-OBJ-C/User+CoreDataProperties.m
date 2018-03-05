//
//  User+CoreDataProperties.m
//  Wag-CC-OBJ-C
//
//  Created by Karl Pfister on 3/4/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//
//

#import "User+CoreDataProperties.h"

@implementation User (CoreDataProperties)

+ (NSFetchRequest<User *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"User"];
}

@dynamic avatarImage;
@dynamic avatarImageString;
@dynamic bronzeBadgeCount;
@dynamic goldBadgeCount;
@dynamic name;
@dynamic silverBadgeCount;

@end
