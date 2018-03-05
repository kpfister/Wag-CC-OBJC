//
//  User+CoreDataProperties.h
//  Wag-CC-OBJ-C
//
//  Created by Karl Pfister on 3/4/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//
//

#import "User+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface User (CoreDataProperties)

+ (NSFetchRequest<User *> *)fetchRequest;

@property (nullable, nonatomic, retain) NSData *avatarImage;
@property (nullable, nonatomic, copy) NSString *avatarImageString;
@property (nullable, nonatomic, copy) NSString *bronzeBadgeCount;
@property (nullable, nonatomic, copy) NSString *goldBadgeCount;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *silverBadgeCount;

@end

NS_ASSUME_NONNULL_END
