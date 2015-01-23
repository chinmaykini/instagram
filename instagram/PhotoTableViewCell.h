//
//  PhotoTableViewCell.h
//  instagram
//
//  Created by Chinmay Kini on 1/22/15.
//  Copyright (c) 2015 Chinmay Kini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *instaImage;
@property (weak, nonatomic) IBOutlet UILabel *instaLike;
@property (weak, nonatomic) IBOutlet UILabel *instaCaption;
@property (weak, nonatomic) IBOutlet UILabel *instaUser;

@end
