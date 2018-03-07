
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

//@property (nonatomic) NSArray *users;
@property (nonatomic) NSDictionary *data;
@property (nonatomic) UIImage *userImage;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic) NSArray <User*>* users;
@property (nonatomic) NSManagedObjectContext *moc;
@property (nonatomic) AppDelegate *delegate;
// Core data users
//@property (nonatomic) NSManagedObjectContext *context;
//@property (nonatomic, weak) AppDelegate *delegate;

@end

@implementation UsersTableViewController

- (void)viewDidLoad {
   _delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    _moc = _delegate.persistentContainer.viewContext;
    
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"reloadData" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTable:) name:@"reloadData" object:nil];
    
    [[self fetchedResultsController] performFetch:nil];
    self.users = [[self fetchedResultsController]fetchedObjects];
    if (self.users.count == 0) {
        
        NSString *URLString = @"https://api.stackexchange.com/2.2/users?site=stackoverflow";
        [UserController.shared createArrayFromJson:URLString completion:^(NSArray *result, NSError *error) {
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

- (NSFetchedResultsController *)fetchedResultsController {

    if (!_fetchedResultsController) {
        _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:[self fetchRequest] managedObjectContext:[self moc] sectionNameKeyPath:nil cacheName:@"USER_Cache"];
        [NSFetchedResultsController deleteCacheWithName:@"USER_Cache"];
        NSError *error = nil;
        if (![self.fetchedResultsController performFetch:&error]) {
            NSLog(@"Error: %@ %@", error.localizedDescription, error.userInfo);
        }
        [self.tableView reloadData];
    }
    _fetchedResultsController.delegate = self;
    return _fetchedResultsController;
}
- (NSFetchRequest *)fetchRequest {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"User"];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:true];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    return fetchRequest;
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.users.count;
};

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UserCell *cell = [tableView dequeueReusableCellWithIdentifier:@"usercell" forIndexPath:indexPath];
    User *user = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.profileNameLabel.text = user.name;
    cell.goldBadgeCountLabel.text = user.goldBadgeCount;
    cell.silverBadgeCountLabel.text = user.silverBadgeCount;
    cell.bronzeCountLabel.text = user.bronzeBadgeCount;
    // IF the user does not have a avatar image - make one from the string
    if (user.avatarImage == nil) {
        // Start the activity Indicator
        cell.activityIndicator.hidden = false;
        
        NSString *userImageString = user.avatarImageString;
        [ImageController.shared getImage:userImageString completion:^(UIImage *image, NSError *error) {
            [[cell activityIndicator]startAnimating];
            // All UI changes on the main_queue
            dispatch_async(dispatch_get_main_queue(), ^{
                self.userImage = image;
                cell.avatarImage.image = self.userImage;
                // Create data from this image
                NSData *imageData = UIImagePNGRepresentation(image);
                user.avatarImage = imageData;
                [_delegate saveContext];
                cell.activityIndicator.hidden = true;
                [[cell activityIndicator] stopAnimating];
            });
        }];
    } else {
        // Use the imageData from our Persistance Store to create an image
        cell.activityIndicator.hidden = false;
        [[cell activityIndicator]startAnimating];
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *image = [UIImage imageWithData:user.avatarImage];
            cell.avatarImage.image = image;
            cell.activityIndicator.hidden = true;
            [[cell activityIndicator]stopAnimating];
        });
    }

    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
    
}

@end
