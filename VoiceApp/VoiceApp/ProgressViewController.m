//
//  ProgressViewController.m
//  VoiceApp
//
//  Created by Jacus VanHorn on 12/18/13.
//  Copyright (c) 2013 Jacus VanHorn. All rights reserved.
//

#import "ProgressViewController.h"
#import "AppDelegate.h"
@interface ProgressViewController ()

@end

@implementation ProgressViewController

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
    AppDelegate *myAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSInteger counter = 0;
    for (int i=0;i<[myAppDelegate.status count]; i++)
    {
        if ([[myAppDelegate.status objectAtIndex:i] isEqualToString: @"t"])
        {
            counter++;
        }
    }
    self.ProgressLabel.text = [NSString stringWithFormat:@"Days: %@ \r %@ completed %d of %d exercises!",myAppDelegate.days, myAppDelegate.clName, counter, [myAppDelegate.status count]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendButtone:(id)sender {
    AppDelegate *myAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSInteger counter = 0;
    for (int i=0;i<[myAppDelegate.status count]; i++)
    {
        if ([[myAppDelegate.status objectAtIndex:i] isEqualToString: @"t"])
        {
            counter = counter + 1;
        }
    }
    NSLog(@"here: %d", counter);
    NSString *subject = @"Project Report";
    NSString *body = [NSString stringWithFormat:@"Days: %@ \n %@ completed %d of %d exercises!",myAppDelegate.days, myAppDelegate.clName, counter, [myAppDelegate.status count]];
    NSArray *emailAddress = [NSArray arrayWithObject:myAppDelegate.clinEmail];
    
    MFMailComposeViewController *myMailController = [[MFMailComposeViewController alloc] init];
    myMailController.mailComposeDelegate = self;
    [myMailController setSubject:subject];
    [myMailController setMessageBody:body isHTML:NO];
    [myMailController setToRecipients:emailAddress];
    
    [self presentViewController:myMailController animated:YES completion:NULL];
    

}
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0)
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}
@end
