
//
//  UsersTableViewController.m
//  Wag-CC-OBJ-C
//
//  Created by Karl Pfister on 3/1/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

#import "UsersTableViewController.h"
#import "UserController.h"
#import "UserClass.h"
#import "UserCell.h"
#import "ImageController.h"
#import <UIKit/UIKit.h>
#import "User+CoreDataClass.h"
#import "AppDelegate.h"
@import CoreData;

#define JSON_FILE_URL @"https://api.stackexchange.com/2.2/users?site=stackoverflow"

@interface UsersTableViewController ()

@property (nonatomic) NSDictionary *data;
@property (nonatomic) UIImage *userImage;
// Our array of User Class Objects
@property (nonatomic) NSArray <User*>* users;
@property (nonatomic) NSManagedObjectContext *moc;
@property (nonatomic) AppDelegate *delegate;


@end

@implementation UsersTableViewController

- (void)viewDidLoad {
    
    _delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _moc = _delegate.persistentContainer.viewContext;
    
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"reloadData" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTable:) name:@"reloadData" object:nil];
    
    // Get our users from coredata -
    [self getUsers];
    
    // If no users exist on coreData then lets make them
    if (self.users.count == 0) {
        // Using JSON_FILE_URL to make sure I dont mistype it and for readability
        [UserController.shared createArrayFromJson:JSON_FILE_URL completion:^(NSArray *result, NSError *error) {
            self.users = result;
            [self.tableView reloadData];
            
        }];
        // maybe look into didSaveNotification
        [self.tableView reloadData];
        [self.tableView layoutIfNeeded];
    }
    
    [self.tableView reloadData];
    [self.tableView layoutIfNeeded];
}

- (void)reloadTable:(NSNotification *)notification {
    [self.tableView reloadData];
}


-(void)getUsers {
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:_moc];
    [fetch setEntity:entity];
    
    NSError *fetchError = nil;
    NSArray *fetchResult = [_moc executeFetchRequest:fetch error:&fetchError];
    
    if (fetchError) {
        // Handle the error
    } else {
        // Set our array of User objects to the results of the fetch
        self.users = fetchResult;
    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Only one section neccesary for this project
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.users.count;
};

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Create our cell
    UserCell *cell = [tableView dequeueReusableCellWithIdentifier:@"usercell" forIndexPath:indexPath];
    // Get the user for each cell
    User *user = _users[indexPath.row];
    // Set the users data to the cells UI elements
    cell.profileNameLabel.text = user.name;
    cell.goldBadgeCountLabel.text = user.goldBadgeCount;
    cell.silverBadgeCountLabel.text = user.silverBadgeCount;
    cell.bronzeCountLabel.text = user.bronzeBadgeCount;
    // If the user does not have a avatar image - make one from the string
    if (user.avatarImage == nil) {
        // Start the activity Indicator
        cell.activityIndicator.hidden = false;
        [[cell activityIndicator]startAnimating];
        // Readability
        NSString *userImageString = user.avatarImageString;
        [ImageController getImage:userImageString completion:^(UIImage *image, NSError *error) {
            // Complets with an image
            /// All UI changes on the main_queue
            dispatch_async(dispatch_get_main_queue(), ^{
                // Set the cells image to the completion Image
                cell.avatarImage.image = image;
                // Create data from this image
                NSData *imageData = UIImagePNGRepresentation(image);
                user.avatarImage = imageData;
                // Save for future use
                [_delegate saveContext];
                // Stop the activityIndicator and hide it
                cell.activityIndicator.hidden = true;
                [[cell activityIndicator] stopAnimating];
            });
        }];
    } else {
        // Use the imageData from our Persistance Store to create an image
        // Start the Activity indicator
        cell.activityIndicator.hidden = false;
        [[cell activityIndicator]startAnimating];
        /// All UI changes on the main_queue
        dispatch_async(dispatch_get_main_queue(), ^{
            // Take the imageData from the from coredata and create a useable UIImage
            UIImage *image = [UIImage imageWithData:user.avatarImage];
            // Set the cells image to image created from coreData
            cell.avatarImage.image = image;
            // Stop the activityIndicator and hide it
            cell.activityIndicator.hidden = true;
            [[cell activityIndicator]stopAnimating];
        });
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Set the height. This needs better implementation. a static height works for now but its not scalable.
    return 80;
}

@end
