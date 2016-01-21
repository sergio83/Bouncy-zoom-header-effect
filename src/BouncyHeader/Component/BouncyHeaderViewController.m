//
//  BouncyHeaderViewController.m
//  BouncyHeader
//
//  Created by Sergio Cirasa on 1/21/16.
//
//

#import "BouncyHeaderViewController.h"

@interface BouncyHeaderViewController ()

@end

@implementation BouncyHeaderViewController
//----------------------------------------------------------------------------------------------------------------
-(void)viewDidLoad
{
    [super viewDidLoad];    
    self.navigationController.navigationBarHidden = YES;
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, BOUNCY_IMAGE_HEIGHT)];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    self.imageView.backgroundColor = [UIColor clearColor];
    [self.scrollView addSubview:self.imageView];
    [self updateNavigationColor];
}
//----------------------------------------------------------------------------------------------------------------
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.scrollView.delegate = self;
}
//----------------------------------------------------------------------------------------------------------------
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.scrollView.delegate = nil;
}
//----------------------------------------------------------------------------------------------------------------
#pragma mark - Private Methods
- (void)setNavigationBarAlpha:(CGFloat) alpha {
    self.navTitleLabel.alpha = (alpha<0.7)?0:alpha*7-6;
    self.navigationView.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:211.0/255.0 blue:.0/255.0 alpha:alpha];
}
//----------------------------------------------------------------------------------------------------------------
-(void)updateNavigationColor
{
    CGFloat  contentYOffset = self.scrollView.contentOffset.y;
    if(contentYOffset >= kStartAppear && contentYOffset <= kEndAppear){
        CGFloat height = kEndAppear - kStartAppear;
        CGFloat absOffset = (contentYOffset<=0)?(contentYOffset*-1)+abs(kEndAppear):kEndAppear-contentYOffset;
        
        if(absOffset < 0){
            absOffset = 0;
        }else{
            absOffset = height-absOffset;
        }
        [self setNavigationBarAlpha:absOffset/height];
    }else{
        if(contentYOffset >= kEndAppear){
            [self setNavigationBarAlpha:1];
        } else if (contentYOffset < kStartAppear){
            [self setNavigationBarAlpha:0];
            
        }
    }
}
//----------------------------------------------------------------------------------------------------------------
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self updateNavigationColor];
    if (scrollView.contentOffset.y <= 0) {
        self.imageView.frame = CGRectMake(scrollView.contentOffset.y / 2, scrollView.contentOffset.y, self.view.frame.size.width - scrollView.contentOffset.y, BOUNCY_IMAGE_HEIGHT -scrollView.contentOffset.y);
    }
    else {
        self.imageView.frame = CGRectMake(0, +scrollView.contentOffset.y / 3, self.view.frame.size.width, BOUNCY_IMAGE_HEIGHT);
    }
}
//----------------------------------------------------------------------------------------------------------------

@end
