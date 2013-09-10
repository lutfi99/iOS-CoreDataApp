//
//  timelineCell.m
//  Poto
//
//  Created by Hendra Nicholas on 8/30/13.
//  Copyright (c) 2013 Hendra Nicholas. All rights reserved.
//

#import "timelineCell.h"

@implementation timelineCell

@synthesize textLabel, imageTimeline;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
