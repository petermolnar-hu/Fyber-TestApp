//
//  PMOPictureTableViewCell.h
//  Parallels-test
//
//  Created by Peter Molnar on 10/06/2016.
//  Copyright © 2016 Peter Molnar. All rights reserved.
//

@import UIKit;

@class PMOViewWithIndicator;
@class PMOOffer;

@interface PMOOfferTableViewCell : UITableViewCell
@property (copy, nonatomic) NSString *offer_id;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;
@property (weak, nonatomic) IBOutlet PMOViewWithIndicator *indicatorView;
@property (weak, nonatomic) IBOutlet UILabel *payoutLabel;
@property (weak, nonatomic) UIImage *thumbnailImage;
@property (strong, nonatomic) NSIndexPath *indexPath;

@end
