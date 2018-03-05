//
//  AppDelegate.h
//  Wag-CC-OBJ-C
//
//  Created by Karl Pfister on 3/1/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

//+ (AppDelegate *)sharedAppDelegate;
@end

