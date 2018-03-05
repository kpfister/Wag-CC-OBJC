//
//  UserCell.m
//  Wag-CC-OBJ-C
//
//  Created by Karl Pfister on 3/3/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

#import "UserCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation UserCell

@synthesize activityIndicator = _activityIndicator;
@synthesize avatarImage = _avatarImage;

@synthesize profileNameLabel = _profileNameLabel;

@synthesize goldBageView = _goldBageView;
@synthesize goldBadgeCountLabel = _goldBadgeCountLabel;

@synthesize silverBadgeView = _silverBadgeView;
@synthesize silverBadgeCountLabel = _silverBadgeCountLabel;

@synthesize bronzeBadgeView = _bronzeBadgeView;
@synthesize bronzeCountLabel = _bronzeCountLabel;


- (void)awakeFromNib {
    [super awakeFromNib];
    [self designBadgeViews];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)designAvatarImageView{
    _avatarImage.layer.cornerRadius = 8;
    _avatarImage.layer.masksToBounds = true;
}
-(void)designBadgeViews; {
    // Lets make these bad boys a cirle!
    _goldBageView.layer.cornerRadius = _goldBageView.layer.bounds.size.width / 2;
    _silverBadgeView.layer.cornerRadius = _silverBadgeView.layer.bounds.size.width / 2;
    _bronzeBadgeView.layer.cornerRadius = _bronzeBadgeView.layer.bounds.size.width / 2;
}
@end
