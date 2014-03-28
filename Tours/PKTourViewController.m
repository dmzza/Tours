//
//  PKTourViewController.m
//  Tours
//
//  Created by David Mazza on 3/26/14.
//  Copyright (c) 2014 Peaking Software LLC. All rights reserved.
//

#import "PKTourViewController.h"

@interface PKTourViewController ()

@end

@implementation PKTourViewController {
    CGPoint dragStart;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.contentView loadRequest:[NSURLRequest requestWithURL:self.contentURL]];
    
    [[self.navBar topItem] setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self.parentViewController action:@selector(dismissModalViewControllerAnimated:) ]];
    [[self.navBar topItem] setTitle:self.tourName];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Gesture Recognizer Delegate

- (IBAction)handleDrag:(UIPanGestureRecognizer *)sender {
    CGPoint position = [sender locationInView:[sender view]];
    
    switch ([sender state]) {
        case UIGestureRecognizerStateBegan:
            dragStart = position;
            break;
            
        case UIGestureRecognizerStateChanged:
            [self.mapView setFrame:CGRectMake(0, 0, 1024, 100 + position.y - dragStart.y)];
            [self.navBar setFrame:CGRectMake(0, 100 + position.y - dragStart.y, 1024, 44)];
            break;
            
        case UIGestureRecognizerStateEnded:
            if (position.y - dragStart.y > 100) {
                [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:1 initialSpringVelocity:ABS([sender velocityInView:self.view].y / 768) options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                    [self.mapView setFrame:CGRectMake(0, 0, 1024, 768 - 44)];
                    [self.navBar setFrame:CGRectMake(0, 768 - 44, 1024, 44)];
                } completion:^(BOOL finished) {
                    [self.mapView setScrollEnabled:YES];
                    [[self.navBar topItem] setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(dismissMap) ]];
                }];
            } else {
                [UIView animateWithDuration:1 animations:^{
                    [self.mapView setFrame:CGRectMake(0, 0, 1024, 100)];
                    [self.navBar setFrame:CGRectMake(0, 100, 1024, 44)];
                }];
            }
            break;
            
        default:
            break;
    }
}

- (void)dismissMap {
    [self.mapView setScrollEnabled:NO];
    [[self.navBar topItem] setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self.parentViewController action:@selector(dismissModalViewControllerAnimated:) ]];
    [UIView animateWithDuration:1 animations:^{
        [self.mapView setFrame:CGRectMake(0, 0, 1024, 100)];
        [self.navBar setFrame:CGRectMake(0, 100, 1024, 44)];
    }];
}


@end
