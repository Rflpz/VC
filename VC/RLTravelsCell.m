//
//  RLTravelsCell.m
//  VC
//
//  Created by Rafael Lopez on 3/3/17.
//  Copyright © 2017 Rflpz. All rights reserved.
//

#import "RLTravelsCell.h"

@implementation RLTravelsCell
@synthesize lblPlaceName = _lblPlaceName;
@synthesize imgPlace = _imgPlace;
- (void)awakeFromNib {
    [super awakeFromNib];
    [self layoutIfNeeded];
    _imgPlace.layer.cornerRadius = 7;
    _imgPlace.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
