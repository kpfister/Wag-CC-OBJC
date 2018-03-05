//
//  UserCell.m
//  Wag-CC-OBJ-C
//
//  Created by Karl Pfister on 3/3/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

#import "UserCell.h"

@implementation UserCell

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
