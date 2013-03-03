//
//  AppDelegate.m
//  splitviewmovietest
//
//  Created by Benjamin Durth on 02.03.13.
//  Copyright (c) 2013 Benjamin Durth. All rights reserved.
//

#import "AppDelegate.h"
#import "MasterViewController.h"
#import "DetailViewController.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // setup splitviewcontroller + master and detail views withon their navigation controllers
    
    MasterViewController *masterVC = [[MasterViewController alloc] initWithNibName:@"MasterViewController" bundle:nil];
    masterVC.title = @"MasterLicious";
    DetailViewController *detailVC = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    
    UINavigationController *masterNC = [[UINavigationController alloc] initWithRootViewController:masterVC];
    UINavigationController *detailNC = [[UINavigationController alloc] initWithRootViewController:detailVC];
    
    UISplitViewController *splitVC = [[UISplitViewController alloc] init];
    splitVC.viewControllers = @[masterNC,detailNC];
    splitVC.delegate = self;
    
    self.window.rootViewController = splitVC;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - UISplitViewControllerDelegate

// Called when a button should be added to a toolbar for a hidden view controller.
// Implementing this method allows the hidden view controller to be presented via a swipe gesture if 'presentsWithGesture' is 'YES' (the default).
- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc{
    
    NSLog(@"willHideViewController:withBarButtonItem:%@", barButtonItem);
    
    // master view is now hidden, we need to add the navigation button for detail view controller manually!
    UINavigationController *detailNC = svc.viewControllers[1];
    UIViewController *detailVC = detailNC.topViewController;
    //barButtonItem.title = @"TEST"; // !!!:unless the title is set or the master vc has a .title attribute set, there no navigation bar buton item will be visible
    detailVC.navigationItem.leftBarButtonItem = barButtonItem;
}

// Called when the view is shown again in the split view, invalidating the button and popover controller.
- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem{

    NSLog(@"willShowViewController:invalidatingBarButtonItem%@", barButtonItem);
    
    //barButtonItem = nil; // ???:just nilling the bar button item is not sufficient! snavigation bar etter is not used!
    
    // getting this button within the master vc button bar..
    // nilling it!
    UINavigationController *detailNC = svc.viewControllers[1];
    UIViewController *detailVC = detailNC.topViewController;
    detailVC.navigationItem.leftBarButtonItem = nil; // removing first button in the button array, invoking the setter of navigationItem!!!
}

// Called when the view controller is shown in a popover so the delegate can take action like hiding other popovers.
- (void)splitViewController:(UISplitViewController *)svc popoverController:(UIPopoverController *)pc willPresentViewController:(UIViewController *)aViewController{

}

// Returns YES if a view controller should be hidden by the split view controller in a given orientation.
// (This method is only called on the leftmost view controller and only discriminates portrait from landscape.)
- (BOOL)splitViewController:(UISplitViewController *)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation NS_AVAILABLE_IOS(5_0){
    
    // not hiding in landscape mode
    if ( UIInterfaceOrientationIsLandscape(orientation) ){
        return NO;
    }
    
    // hiding in portrait mode
    return YES;
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