//
//  UserCell.m
//  Wag-CC-OBJ-C
//
//  Created by Karl Pfister on 3/3/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

#import "UserCell.h"

@implementation UserCell
//@property (weak, nonatomic) IBOutlet UIImageView *avatarImage;
//@property (weak, nonatomic) IBOutlet UILabel *profileNameLabel;
//@property (weak, nonatomic) IBOutlet UILabel *goldBadgeCountLabel;
//@property (weak, nonatomic) IBOutlet UILabel *silverBadgeCountLabel;
////@property (weak, nonatomic) IBOutlet UILabel *bronzeCountLabel;
//@synthesize nameLabel = _nameLabel;
//@synthesize prepTimeLabel = _prepTimeLabel;
//@synthesize thumbnailImageView = _thumbnailImageView;

@synthesize profileNameLabel = _profileNameLabel;
@synthesize goldBadgeCountLabel = _goldBadgeCountLabel;
@synthesize silverBadgeCountLabel = _silverBadgeCountLabel;
@synthesize bronzeCountLabel = _bronzeCountLabel;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
