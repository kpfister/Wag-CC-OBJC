//
//  UserClass.h
//  Wag-CC-OBJ-C
//
//  Created by Karl Pfister on 3/2/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>

@interface UserClass : NSObject

// Place my Public properties here

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *avatarImageString;
@property (nonatomic, copy) NSDictionary *dict;
@property (nonatomic, copy) NSDictionary *badges;
@property (nonatomic, copy) NSString *bronzeBadgeCount;
@property (nonatomic, copy) NSString *silverBadgeCount;
@property (nonatomic, copy) NSString *goldBadgeCount;
//@property (nonatomic, copy) UIImage *avatarImage;

-(instancetype)initWithDictionary:(NSDictionary *)dict;

/*
 Objectve C Method name Syntax
 
 Instance Method (-) ( return type ) method name Part : (paramater type) paramater name
 or Class Method (+)
 */

@end
