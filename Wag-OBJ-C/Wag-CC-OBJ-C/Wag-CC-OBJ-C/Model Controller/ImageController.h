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

@property UIImage *image;
// Take a url string and complete with an image
+(ImageController *)getImage: (NSString *)url completion: (void(^)(UIImage *image, NSError *error))completion;

@end
