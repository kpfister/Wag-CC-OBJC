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
        
//        AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
//        NSManagedObjectContext *context = delegate.persistentContainer.viewContext;
//        NSManagedObject *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
        
        //[self setValuesForKeysWithDictionary:dict];
        self.name = dict[@"display_name"];
        self.avatarImageString = dict[@"profile_image"];
        self.badges = dict[@"badge_counts"];
        self.goldBadgeCount = self.badges[@"gold"];
        self.silverBadgeCount = self.badges[@"silver"];
        self.bronzeBadgeCount = self.badges[@"bronze"];
        
//        [user setValue:self.name forKey:@"name"];
//        [user setValue:self.avatarImageString forKey:@"avatarImageString"];
//        //[user setValue:self.badges forKey:@"badges"];
//        [user setValue:self.goldBadgeCount forKey:@"goldBadgeCount"];
//        [user setValue:self.silverBadgeCount forKey:@"silverBadgeCount"];
//        [user setValue:self.bronzeBadgeCount  forKey:@"bronzeBadgeCount"];
//        delegate.saveContext;
//        [user setValue:self.name forKey:@"display_Name"];
        
//        self.delegate = (AppDelegate *) [[UIApplication sharedApplication]delegate];
//        self.context = self.delegate.persistentContainer.viewContext;
        /*
         @property (nullable, nonatomic, retain) NSData *avatarImage;
         @property (nullable, nonatomic, copy) NSString *avatarImageString;
         @property (nullable, nonatomic, retain) NSData *badges;
         @property (nonatomic) int32_t bronzeBadgeCount;
         @property (nullable, nonatomic, retain) NSData *dict;
         @property (nonatomic) int32_t goldBadgeCount;
         @property (nullable, nonatomic, copy) NSString *name;
         @property (nonatomic) int32_t silverBadgeCount;
         */
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
/*
 CoreDataAppDelegate *appDelegate =
 [[UIApplication sharedApplication] delegate];
 
 NSManagedObjectContext *context =
 [appDelegate managedObjectContext];
 NSManagedObject *newScore;
 newScore = [NSEntityDescription
 insertNewObjectForEntityForName:@"Scores"
 inManagedObjectContext:context];
 [newScore setValue: _scoreToBeAddedAsString forKey:@"score"];
 NSError *error;
 [context save:&error];

 */
