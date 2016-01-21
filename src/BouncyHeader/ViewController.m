//
//  ViewController.m
//  BouncyHeader
//
//  Created by Sergio Cirasa on 1/21/16.
//
//

#import "ViewController.h"
#import "Constants.h"

@interface ViewController ()
@property (strong, nonatomic) UIView *containerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navTitleLabel.text = kTitleLabel;
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 568)];
    self.containerView.backgroundColor = [UIColor whiteColor];
    self.imageView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
    self.color = [UIColor colorWithRed:131.0/255.0 green:57.0/255.0 blue:170.0/255.0 alpha:1.0];
    [self populateContainer];
}
//---------------------------------------------------------------------------------------------------------------------
-(void)populateContainer
{
    self.imageView.image = [UIImage imageNamed:@"HeaderImage.png"];    
    self.containerView.frameWidth = self.view.frameWidth;
    
    UIView * line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.containerView.frameWidth, 3)];
    line.backgroundColor = self.color;
    [self.containerView addSubview:line];
    
    CGFloat margin = 8;
    CGFloat width = self.view.frameWidth - margin * 2;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, 13, width, 20)];
    titleLabel.font = [UIFont fontWithName:@"OpenSans" size:17];
    titleLabel.text = kTitleLabel;
    [self.containerView addSubview:titleLabel];
    
    UITextView *descriptionTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, titleLabel.frameBottom+10, self.containerView.frameWidth, 120)];
    descriptionTextView.text = kDescriptionLabel;
    descriptionTextView.font = [UIFont fontWithName:@"OpenSans" size:15];
    descriptionTextView.editable = NO;
    descriptionTextView.scrollEnabled = NO;
    [self.containerView addSubview:descriptionTextView];
    descriptionTextView.textContainerInset = UIEdgeInsetsMake(1, 0, 0, 0);
    
    CGSize textSize = [descriptionTextView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    descriptionTextView.frameHeight = textSize.height;
    
    self.containerView.frameY = self.imageView.frameBottom;
    self.containerView.frameHeight = descriptionTextView.frameBottom;
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.containerView.frameBottom);
    [self.scrollView addSubview:self.containerView];
}
//---------------------------------------------------------------------------------------------------------------------

@end
