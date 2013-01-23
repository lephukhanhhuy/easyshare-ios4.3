//
//  ViewController.m
//  easyshare
//
//  Created by Codespot on 1/23/13.
//  Copyright (c) 2013 Codespot. All rights reserved.
//

#import "ViewController.h"

#import "DETweetComposeViewController.h"
#import "DEFacebookComposeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)shareFacebook:(id)sender
{
    DEFacebookComposeViewController *facebookViewComposer = [[[DEFacebookComposeViewController alloc] init] autorelease];
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    
    [facebookViewComposer setInitialText:@"Look on this"];
    
    [facebookViewComposer addImage:[UIImage imageNamed:@"image.png"]];
    
    [facebookViewComposer addURL:[NSURL URLWithString:@"http://google.com/"]];
    
    [facebookViewComposer setCompletionHandler:^(DEFacebookComposeViewControllerResult result) {
        switch (result) {
            case DEFacebookComposeViewControllerResultCancelled:
                NSLog(@"Facebook Result: Cancelled");
                break;
            case DEFacebookComposeViewControllerResultDone:
                NSLog(@"Facebook Result: Sent");
                break;
        }
        
        [self dismissModalViewControllerAnimated:YES];
    }];
    
    [self presentModalViewController:facebookViewComposer animated:YES];
}
- (IBAction)shareTwitter:(id)sender
{
    DETweetComposeViewControllerCompletionHandler completionHandler = ^(DETweetComposeViewControllerResult result) {
        switch (result) {
            case DETweetComposeViewControllerResultCancelled:
                NSLog(@"Twitter Result: Cancelled");
                break;
            case DETweetComposeViewControllerResultDone:
                NSLog(@"Twitter Result: Sent");
                break;
        }
        [self dismissModalViewControllerAnimated:YES];
    };
    
    DETweetComposeViewController *twitterViewComposer = [[[DETweetComposeViewController alloc] init] autorelease];
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    [twitterViewComposer setCompletionHandler:completionHandler];
    
    // Optionally, set alwaysUseDETwitterCredentials to YES to prevent using
    //  iOS5 Twitter credentials.
    //    tcvc.alwaysUseDETwitterCredentials = YES;
    [twitterViewComposer setInitialText:@"Look on this"];
    
    [twitterViewComposer addImage:[UIImage imageNamed:@"image.png"]];
    
    [twitterViewComposer addURL:[NSURL URLWithString:@"http://google.com/"]];
    
    [self presentModalViewController:twitterViewComposer animated:YES];
}
@end
