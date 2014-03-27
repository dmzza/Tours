//
//  PKCityCell.m
//  Tours
//
//  Created by David Mazza on 3/26/14.
//  Copyright (c) 2014 Peaking Software LLC. All rights reserved.
//

#import "PKCityCell.h"

@implementation PKCityCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
