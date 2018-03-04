//
//  ImageController.h
//  Wag-CC-OBJ-C
//
//  Created by Karl Pfister on 3/4/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageController : NSObject
//-(void)createArrayFromJson: (NSString *)url completion:(void(^)(NSArray *result, NSError *error))completion;
@property UIImage *image;

+(id)shared;

-(void)getImage: (NSString *)url completion: (void(^)(UIImage *image, NSError *error))completion;

@end
