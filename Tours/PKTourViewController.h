//
//  PKTourViewController.h
//  Tours
//
//  Created by David Mazza on 3/26/14.
//  Copyright (c) 2014 Peaking Software LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface PKTourViewController : UIViewController

@property (strong, nonatomic) IBOutlet UINavigationBar *navBar;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UIWebView *contentView;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *dragRecognizer;

@property (strong, nonatomic) NSString *tourName;
@property (strong, nonatomic) NSURL *contentURL;

@end
