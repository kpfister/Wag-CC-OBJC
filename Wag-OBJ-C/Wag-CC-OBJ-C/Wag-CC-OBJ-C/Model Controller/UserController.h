//
//  UserController.h
//  Wag-CC-OBJ-C
//
//  Created by Karl Pfister on 3/2/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserClass.h"

@interface UserController : NSObject

// I want to make a singleton so I can have one instance of this class to call this method
+(id)shared;

@property NSArray *users;

// I want to give this method a URL and have it complete with a dictionary -
-(void)createArrayFromJson: (NSString *)url completion:(void(^)(NSArray *result, NSError *error))completion;

@end
