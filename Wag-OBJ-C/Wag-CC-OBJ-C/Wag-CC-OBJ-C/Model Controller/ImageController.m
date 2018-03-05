//
//  ImageController.m
//  Wag-CC-OBJ-C
//
//  Created by Karl Pfister on 3/4/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

#import "ImageController.h"

@implementation ImageController

+(id)shared {
    static ImageController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    // Static becuase the scope of these I only want to access here
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        //The very first time `shared` method is called, the `dispatch_once` block will be called, setting the `sharedInstance` to an instance of your object. The next time `shared` method is called, `dispatch_once` will not be called. `dispatch_once` with the `onceToken` just make sure that if this method is called on multiple thread the block will still only run once.
    });
    return sharedInstance;
}

-(void)getImage: (NSString *)url completion: (void(^)(UIImage *image, NSError *error))completion; {
    NSURL *urlFromString = [NSURL URLWithString:url];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:urlFromString completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            // If there is no Error - Check if there is data
            if (data != nil) {
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
}

@end
