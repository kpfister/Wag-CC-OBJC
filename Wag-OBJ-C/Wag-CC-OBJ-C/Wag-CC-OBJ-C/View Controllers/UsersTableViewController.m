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

@property (nonatomic) NSArray *users;
@property (nonatomic) NSDictionary *data;
@property (nonatomic) UIImage *userImage;

@property (nonatomic) NSArray <User*>* cdUsers;
// Core data users
//@property (nonatomic) NSManagedObjectContext *context;
//@property (nonatomic, weak) AppDelegate *delegate;

@end

@implementation UsersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        //self.delegate = (AppDelegate *) [[UIApplication sharedApplication]delegate];
    //self.delegate = [AppDelegate sharedAppDelegate];
    
    [self fetchCoreDataUsers];
    
    if (self.cdUsers.count == 0) {
    
        NSString *URLString = @"https://api.stackexchange.com/2.2/users?site=stackoverflow";
        [UserController.shared createArrayFromJson:URLString completion:^(NSArray *result, NSError *error) {
            self.users = result;
            //[[self tableView]reloadData];
        }];
        // maybe look into didSaveNotification
        //[self fetchCoreDataUsers];
     //self.tableView.reloadData;
    }
}
//-(void)viewWillAppear:(BOOL)animated {
//    [[self tableView]reloadData];
//}

-(void) fetchCoreDataUsers {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = delegate.persistentContainer.viewContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"User"];
    self.cdUsers = [context executeFetchRequest:request error:nil];
    [self.tableView reloadData];
}
// Uncomment the following line to preserve selection between presentations.
// self.clearsSelectionOnViewWillAppear = NO;

// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
// self.navigationItem.rightBarButtonItem = self.editButtonItem;
//]}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.cdUsers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Configure the cell...
    UserCell *cell = [tableView dequeueReusableCellWithIdentifier:@"usercell" forIndexPath:indexPath];
        User *user = _cdUsers [indexPath.row];
    
    
    cell.profileNameLabel.text = user.name;
    cell.goldBadgeCountLabel.text = user.goldBadgeCount;
    cell.silverBadgeCountLabel.text = user.silverBadgeCount;
    cell.bronzeCountLabel.text = user.bronzeBadgeCount;
    
    NSString *userImageString = user.avatarImageString;
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [activityIndicator setCenter:cell.imageView.center];
    [activityIndicator startAnimating];
    [cell.contentView addSubview:activityIndicator];
    
    [ImageController.shared getImage:userImageString completion:^(UIImage *image, NSError *error) {

        dispatch_async(dispatch_get_main_queue(), ^{
            self.userImage = image;
            cell.avatarImage.image = self.userImage;
//            [activityIndicator.stopAnimating];
//            [activityIndicator removeFromSuperview];
        });
    }];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

//-(void)saveToCoreData {
//    self.users;
//}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
