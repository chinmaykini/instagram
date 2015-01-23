//
//  PhotoTableViewCell.h
//  instagram
//
//  Created by Chinmay Kini on 1/22/15.
//  Copyright (c) 2015 Chinmay Kini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *userField;
@property (weak, nonatomic) IBOutlet UIImageView *imageCellField;
@property (weak, nonatomic) IBOutlet UILabel *likesCellField;
@property (weak, nonatomic) IBOutlet UILabel *captionField;

@end
