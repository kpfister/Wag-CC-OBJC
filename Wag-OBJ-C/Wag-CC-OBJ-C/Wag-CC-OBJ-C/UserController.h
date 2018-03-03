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
// I want to give this method a URL and have it complete with a dictionary -
-(void)createDictionaryFromJson: (NSString *)url completion:(void(^)(NSDictionary *result, NSError *error))completion;
//-(void)dictionaryFromJson:(NSString *)url parameter:(NSString *)params callback:(void(^)(NSDictionary *result, NSError *error))callback;
@end
