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
@property (nullable, nonatomic, retain) NSData *badges;
@property (nonatomic) int32_t bronzeBadgeCount;
@property (nullable, nonatomic, retain) NSData *dict;
@property (nonatomic) int32_t goldBadgeCount;
@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int32_t silverBadgeCount;

@end

NS_ASSUME_NONNULL_END
