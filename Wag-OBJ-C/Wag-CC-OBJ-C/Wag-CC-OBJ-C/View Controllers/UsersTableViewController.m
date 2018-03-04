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

#define JSON_FILE_URL @"https://api.stackexchange.com/2.2/users?site=stackoverflow"

@interface UsersTableViewController ()

@property (nonatomic) NSArray *users;
@property (nonatomic) NSDictionary *data;
//@property (nonatomic) UserClass *users;


@end

@implementation UsersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *URLString = @"https://api.stackexchange.com/2.2/users?site=stackoverflow";
    [UserController.shared createArrayFromJson:URLString completion:^(NSArray *result, NSError *error) {
        self.users = result;
        self.tableView.reloadData;
    }];
}
    //[self.tableView registerNib:[UINib nibWithName:@"UserCell" bundle:nil] forCellReuseIdentifier:@"userCell"];
    
//    UINib *cellNib = [UINib nibWithNibName:@"UserCell" bundle:nil];
//    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"usercell"];
    
//    [UserController.shared createDictionaryFromJson:URLString completion:^(NSDictionary *result, NSError *error) {
//        if (error == nil) {
//            self.users = result[@"items"];
//            [[UserClass alloc] initWithUser:self.users[@"display_name"] avatarImageString:self.users[@"display_name"] bronzeBadgeCount:self.users[@"display_name"] silverBadgeCount:self.users[@"display_name"] goldBadgeCount:self.users[@"display_name"]];
//            [[UserClass alloc] init initWithUser:_users[@"display_name"] avatarImageString:_users[@"profile_image"] bronzeBadgeCount:@"bagde" silverBadgeCount:@"bagde" goldBadgeCount:@"bagde"];
        //}
//        self.tableView.reloadData;
//    }];
//
//}


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
    
    //Configure the cell...
    UserCell *cell = [tableView dequeueReusableCellWithIdentifier:@"usercell" forIndexPath:indexPath];
    UserClass *user = _users [indexPath.row];
    cell.profileNameLabel.text = user.name;
    cell.goldBadgeCountLabel.text = [user.goldBadgeCount stringValue];
    cell.silverBadgeCountLabel.text = [user.silverBadgeCount stringValue];
    cell.bronzeCountLabel.text = [user.bronzeBadgeCount stringValue];
    // Get the images set up here.
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
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
