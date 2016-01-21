//
//  BouncyHeaderViewController.h
//  BouncyHeader
//
//  Created by Sergio Cirasa on 1/21/16.
//
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

#define BOUNCY_IMAGE_HEIGHT 186
#define kStartAppear 8
#define kEndAppear   56

@interface BouncyHeaderViewController : BaseViewController<UIScrollViewDelegate>

@property(nonatomic,weak) IBOutlet UIScrollView *scrollView;
@property(nonatomic,strong)  UIImageView *imageView;

@property(nonatomic,weak)  IBOutlet UILabel *navTitleLabel;
@property(nonatomic,weak)  IBOutlet UIView *navigationView;

@end
