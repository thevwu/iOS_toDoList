//
//  TaskCell.m
//  todoList
//
//  Created by Victor Wu on 3/16/16.
//  Copyright © 2016 wayfair. All rights reserved.
//

#import "TaskCell.h"

@implementation TaskCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    self.bodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 200, 30)];
    
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.bodyLabel.translatesAutoresizingMaskIntoConstraints = NO;

    return [super initWithStyle:style reuseIdentifier:reuseIdentifier];
}

- (void) configureLayout {
    [self addSubview:self.titleLabel];
    [self addSubview:self.bodyLabel];

    NSDictionary *subViews = @{@"titleLabel" : self.titleLabel, @"bodyLabel" : self.bodyLabel};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(-10)-[titleLabel]-(0)-[bodyLabel]-|" options:0 metrics:0 views:subViews]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(10)-[titleLabel]-(10)-|" options:0 metrics:0 views:subViews]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.bodyLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.titleLabel attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0]];
}

@end
