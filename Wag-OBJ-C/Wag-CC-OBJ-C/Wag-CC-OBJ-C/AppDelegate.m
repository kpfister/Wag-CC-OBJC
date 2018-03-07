//
//  AppDelegate.m
//  testing
//
//  Created by Karl Pfister on 3/4/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

#import "AppDelegate.h"
#import "User+CoreDataClass.h"

@interface AppDelegate ()
// Convience
@property (nonatomic) NSManagedObjectContext *context;


@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.context = self.persistentContainer.viewContext;
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    /// I dont need to save the context here as Im saving the users when they are created.
    //[self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;
# pragma marl - Mock Data to test my Coredata

//-(void) createData {
//     Mock data
//        User *user1 = [[User alloc] initWithContext:self.context];
//        user1.name = @"Fred";
//        user1.bronzeBadgeCount = 12;
//        user1.silverBadgeCount = 12;
//        user1.goldBadgeCount = 12;
//    [self saveContext];
//}
//-(void) basicFetch {
//    // Mock
//    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"User"];
//
//    NSArray <User*>* users = [self.context executeFetchRequest:request error:nil];
//    [self printResultsFromArray:users];
//
//}
//// Testing
//-(void)printResultsFromArray: (NSArray <User*>*) users {
//    for (User *user in users) {
//        NSLog(@"%@ has bronze coins", user.name);
//    }
//}

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"User"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
   
    NSError *error = nil;
    if ([self.context hasChanges] && ![self.context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end

