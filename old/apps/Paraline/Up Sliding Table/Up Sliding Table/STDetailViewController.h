//
//  STDetailViewController.h
//  Up Sliding Table
//
//  Created by Samuel Svenningsen on 9/10/14.
//  Copyright (c) 2014 Sam Svenningsen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
