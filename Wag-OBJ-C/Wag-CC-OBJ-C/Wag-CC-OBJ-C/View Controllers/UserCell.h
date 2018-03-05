//
//  UserCell.h
//  Wag-CC-OBJ-C
//
//  Created by Karl Pfister on 3/3/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *avatarImage;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (weak, nonatomic) IBOutlet UILabel *profileNameLabel;

@property (weak, nonatomic) IBOutlet UIView *goldBageView;
@property (weak, nonatomic) IBOutlet UILabel *goldBadgeCountLabel;

@property (weak, nonatomic) IBOutlet UIView *silverBadgeView;
@property (weak, nonatomic) IBOutlet UILabel *silverBadgeCountLabel;

@property (weak, nonatomic) IBOutlet UIView *bronzeBadgeView;
@property (weak, nonatomic) IBOutlet UILabel *bronzeCountLabel;

-(void)designBadgeViews;

// Add some nice UI touches
@end
