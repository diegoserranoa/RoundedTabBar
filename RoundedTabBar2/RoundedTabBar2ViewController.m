//
//  RoundedTabBar2ViewController.m
//  RoundedTabBar2
//
//  Created by Diego Serrano on 8/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RoundedTabBar2ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface RoundedTabBar2ViewController ()

@end

@implementation RoundedTabBar2ViewController
@synthesize tabBarController = _tabBarController;

-(void)loadView
{
    [super loadView];
    
    _tabBarController = [[UITabBarController alloc] init];
    _tabBarController.delegate = self;
    
    CGRect viewFrame = _tabBarController.tabBar.frame;
    //change these parameters according to you.
    viewFrame.origin.x = -10.0;
    viewFrame.origin.y = 390.0;
    viewFrame.size.height = 70.0;
    viewFrame.size.width = 340.0;
    
    _tabBarController.tabBar.frame = viewFrame;
    [self.navigationController.navigationBar setHidden:YES];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_tabBarController.tabBar.bounds
                                                   byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight
                                                         cornerRadii:CGSizeMake(340.0, 60.0)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = maskPath.bounds;
    maskLayer.path = maskPath.CGPath;
    
    _tabBarController.tabBar.layer.mask = maskLayer;
    _tabBarController.tabBar.userInteractionEnabled = YES;
    
    
    NSMutableArray *localViewControllersArray = [[NSMutableArray alloc] initWithCapacity:5];
    
    
    // Root view controller for "Identify Bird"
    UIViewController *vc1;
    vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"Tab1"];
    vc1.title = @"Tab1";
    
    UIViewController *vc2;
    vc2 = [self.storyboard instantiateViewControllerWithIdentifier:@"Tab2"];
    vc2.title = @"Tab2";
    
    UIViewController *vc3;
    vc3 = [self.storyboard instantiateViewControllerWithIdentifier:@"Tab3"];
    vc3.title = @"Tab3";
    
    UIViewController *vc4;
    vc4 = [self.storyboard instantiateViewControllerWithIdentifier:@"Tab4"];
    vc4.title = @"Tab4";
    
    UIViewController *vc5;
    vc5 = [self.storyboard instantiateViewControllerWithIdentifier:@"Tab5"];
    vc5.title = @"Tab5";
    
    [localViewControllersArray addObject:vc1];
    [localViewControllersArray addObject:vc2];
    [localViewControllersArray addObject:vc3];
    [localViewControllersArray addObject:vc4];
    [localViewControllersArray addObject:vc5];
    
    // Point the tab bar controllers view controller array to the array
    // of view controllers we just populated
    _tabBarController.viewControllers = localViewControllersArray;
    
    // Add subview to portrait window to reference the tabbarcontroller
    [self.view addSubview:_tabBarController.view];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
