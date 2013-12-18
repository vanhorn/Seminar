//
//  ClientInfoController.m
//  VoiceApp
//
//  Created by Jacus VanHorn on 12/16/13.
//  Copyright (c) 2013 Jacus VanHorn. All rights reserved.
//

#import "ClientInfoController.h"
#import "AppDelegate.h"
@interface ClientInfoController ()

@end

@implementation ClientInfoController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)infoNextButton:(id)sender {
    AppDelegate *myAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    myAppDelegate.clinEmail = self.ClinicianEmail.text;
    myAppDelegate.clinName = self.clinicianName.text;
    myAppDelegate.clEmail = self.ClientEmail.text;
    myAppDelegate.clName = self.ClientName.text;
    
    UIStoryboard *myStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *myViewController = [myStoryBoard instantiateViewControllerWithIdentifier:@"TreatmentViewController"];
    [self presentViewController:myViewController animated:YES completion:nil];
}
@end
