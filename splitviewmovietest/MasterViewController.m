//
//  MasterViewController.m
//  splitviewmovietest
//
//  Created by Benjamin Durth on 02.03.13.
//  Copyright (c) 2013 Benjamin Durth. All rights reserved.
//

#import "MasterViewController.h"
#import "MyMoviePlayerViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark button handling

-(IBAction)handleButtonTapped:(id)sender{
    if (sender == self.playMovieButton ) {
        [self playMovie];
    }
}

#pragma mark movie player

-(void)playMovie{
    NSURL *movieURL = [[NSBundle mainBundle] URLForResource:@"movie" withExtension:@"m4v"];
    MyMoviePlayerViewController *myMovieVC = [[MyMoviePlayerViewController alloc] initWithContentURL:movieURL];
    [self presentViewController:myMovieVC animated:YES completion:^{
        //..
    }];
}

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
