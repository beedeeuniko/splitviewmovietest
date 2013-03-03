//
//  MasterViewController.h
//  splitviewmovietest
//
//  Created by Benjamin Durth on 02.03.13.
//  Copyright (c) 2013 Benjamin Durth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UIViewController

@property(nonatomic, weak, readwrite) IBOutlet UIButton *playMovieButton;

-(IBAction)handleButtonTapped:(id)sender;

@end
