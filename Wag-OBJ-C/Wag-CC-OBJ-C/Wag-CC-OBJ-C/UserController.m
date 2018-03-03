//
//  UserController.m
//  Wag-CC-OBJ-C
//
//  Created by Karl Pfister on 3/2/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

#import "UserController.h"
#import "UserClass.h"

@implementation UserController
+(id)shared {
    static UserController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    // Static becuase the scope of these I only want to access here
    
    // As I understand it - I want to make create this shared insantnce on the background thread and it looks like if I use the once token It happens once then dealloc when its over? - Shakey on this one.
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(void)createDictionaryFromJson: (NSString *)url completion:(void(^)(NSDictionary *result, NSError *error))completion; {
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    
    //create the Method "GET"
    [urlRequest setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // If there is no error
        if (error == nil) {
            //Check if there is data
            if (data != nil) {
                NSError *readError;
                NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&readError];
                if (readError == nil) {
                    completion(jsonDictionary, nil);
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

@end
