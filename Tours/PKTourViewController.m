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

@implementation PKTourViewController

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
    [self.contentView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://jordanandalaina.exposure.so/hello-spring"]]];
    
    [[self.navBar topItem] setRightBarButtonItem:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self.parentViewController action:@selector(dismissModalViewControllerAnimated:) ]];
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

@end
