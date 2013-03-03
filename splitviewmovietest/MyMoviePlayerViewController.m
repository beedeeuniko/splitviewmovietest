//
//  MyMoviePlayerViewController.m
//  splitviewmovietest
//
//  Created by Benjamin Durth on 02.03.13.
//  Copyright (c) 2013 Benjamin Durth. All rights reserved.
//

#import "MyMoviePlayerViewController.h"

@implementation MyMoviePlayerViewController

#pragma mark - autorotation

// iOS 5

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}


// iOS 6


- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
    
}

//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation


@end
