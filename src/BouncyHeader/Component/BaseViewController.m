//
//  BaseViewController.m
//  BouncyHeader
//
//  Created by Sergio Cirasa on 1/21/16.
//
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
//--------------------------------------------------------------------------------------------------------------------------
-(void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:[self preferredStatusBarStyle] animated:animated];
    
    if(self.navigationItem.backBarButtonItem!=nil)
        self.navigationItem.backBarButtonItem.title = @"";
}
//--------------------------------------------------------------------------------------------------------------------------
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return (UIInterfaceOrientationMaskPortrait|UIInterfaceOrientationMaskPortraitUpsideDown);
}
//--------------------------------------------------------------------------------------------------------------------------
- (BOOL)shouldAutorotate
{
    return NO;
}
//--------------------------------------------------------------------------------------------------------------------------
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}
//--------------------------------------------------------------------------------------------------------------------------
- (void)customizeNavigationBar {
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setImage:[UIImage imageNamed:@"backButton.png"] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(onReturnAction:) forControlEvents:UIControlEventTouchUpInside];
    cancelButton.frame = CGRectMake(0, 0, 60, 44);
    cancelButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithCustomView:cancelButton];
    self.navigationItem.leftBarButtonItem = leftButton;
    
}
//--------------------------------------------------------------------------------------------------------------------------
#pragma mark - IBAction Methods
- (IBAction)onReturnAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
//--------------------------------------------------------------------------------------------------------------------------

@end
