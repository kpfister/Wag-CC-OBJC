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

#define JSON_FILE_URL @"https://api.stackexchange.com/2.2/users?site=stackoverflow"

@interface UsersTableViewController ()

@property (nonatomic) NSArray *users;
@property (nonatomic) NSDictionary *data;

@end

@implementation UsersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *URLString = @"https://api.stackexchange.com/2.2/users?site=stackoverflow";
    
    [UserController.shared createDictionaryFromJson:URLString completion:^(NSDictionary *result, NSError *error) {
        if (error == nil) {
            self.users = result[@"items"];
        }
        self.tableView.reloadData;
    }];
    
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
    return self.users.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"userCell" forIndexPath:indexPath];
//    [[UserClass alloc]init]
//    initWithUser:_users["profile_name"] avatarImageString:_users["profile_name"] bronzeBadgeCount:_users["profile_name"] silverBadgeCount:_users["profile_name"] goldBadgeCount:_users["profile_name"]
    //Configure the cell...
    
    return cell;
}


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
