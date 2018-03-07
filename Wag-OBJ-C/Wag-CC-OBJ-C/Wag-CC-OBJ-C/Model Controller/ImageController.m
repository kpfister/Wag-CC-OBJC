//
//  ImageController.m
//  Wag-CC-OBJ-C
//
//  Created by Karl Pfister on 3/4/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

#import "ImageController.h"

@implementation ImageController

+(ImageController *)getImage: (NSString *)url completion: (void(^)(UIImage *image, NSError *error))completion; {
    // First, create a URL from teh string passed into the method
    NSURL *urlFromString = [NSURL URLWithString:url];
    NSURLSession *session = [NSURLSession sharedSession];
    // Start the session and dataTask
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:urlFromString completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            // If there is no Error - Check if there is data
            if (data != nil) {
                // If there is data create the image
                UIImage *image = [UIImage imageWithData:data];
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion(image, nil);
                });
            } else {
                completion(nil, error);
                // There is not a error from the data task but the data is nil
            }
        } else {
            completion(nil, error);
            // Handle the error
        }
    }];
    [dataTask resume];
    return  [ImageController alloc];
}

@end
