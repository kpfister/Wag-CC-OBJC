//
//  UserController.m
//  Wag-CC-OBJ-C
//
//  Created by Karl Pfister on 3/2/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

#import "UserController.h"
#import "UserClass.h"
#import "User+CoreDataClass.h"
#import "AppDelegate.h"
@import CoreData;

@implementation UserController
+(id)shared {
    static UserController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        //The very first time `shared` method is called, the `dispatch_once` block will be called, setting the `sharedInstance` to an instance of your object. The next time `shared` method is called, `dispatch_once` will not be called. `dispatch_once` with the `onceToken` just make sure that if this method is called on multiple thread the block will still only run once.
    });
    return sharedInstance;
}

-(void)createArrayFromJson: (NSString *)url completion:(void(^)(NSArray *result, NSError *error))completion; {
    // First, create out URL from the string passed into this method
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    // Create the Method "GET"
    [urlRequest setHTTPMethod:@"GET"];
    // Create the Session
    NSURLSession *session = [NSURLSession sharedSession];
    // Set the dataTask with the url created from the url strong
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // If there is no error
        if (error == nil) {
            //Check if there is data
            if (data != nil) {
                // If there is data check if there is an error
                NSError *readError;
                NSDictionary *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&readError];
                if (readError == nil) {
                    // If no error then we have our dectionary and can parse thru it
                    NSMutableArray *itemsFromDictionary = jsonArray[@"items"];
                    // Create custom objects from JSON array
                    // I want to access the jsonArray["Itmes"]
                    // and map thru that array and create a user object from each item in the array
                    NSMutableArray *items = [[NSMutableArray alloc] init];
                    for (NSDictionary *dict in itemsFromDictionary) {
                        UserClass *users = [[UserClass alloc] initWithDictionary:dict];
                        [items addObject:users];
                    }
                    self.users = [items copy];
                    // complete on the main queue
                    dispatch_async(dispatch_get_main_queue(), ^{
                        // Save the users 
                        [self saveUsersToCoreData:self.users];
                        completion(self.users,nil);
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:self];
                    });
                }
                else {
                    completion(nil,error);
                }
            }
        }
        else {
            completion(nil,error);
        }
    }];
    [dataTask resume];
}

// create a method that wil save my users to CD
-(void)saveUsersToCoreData: (NSArray*) users; {
    for (UserClass *classUser in users) {
        // loop through each user in the array
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        NSManagedObjectContext *context = delegate.persistentContainer.viewContext;
        // get our context and insert a new object for the User Entity
        NSManagedObject *user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
        // Set the values
        [user setValue:classUser.name forKey:@"name"];
        [user setValue:classUser.avatarImageString forKey:@"avatarImageString"];
        [user setValue:classUser.goldBadgeCount forKey:@"goldBadgeCount"];
        [user setValue:classUser.silverBadgeCount forKey:@"silverBadgeCount"];
        [user setValue:classUser.bronzeBadgeCount forKey:@"bronzeBadgeCount"];
        // Will save the Image from the cell when its created
        // Save the users
        [delegate saveContext];
    }
}
@end


