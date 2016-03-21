//
//  TableViewCell.h
//  todoList
//
//  Created by Victor Wu on 3/16/16.
//  Copyright © 2016 wayfair. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end
