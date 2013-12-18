//
//  ViewController.m
//  VoiceApp
//
//  Created by Jacus VanHorn on 10/1/13.
//  Copyright (c) 2013 Jacus VanHorn. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"::in viewdidload");
    self.exerciseNames = [[NSArray alloc] initWithObjects:@"Belly Breathing", @"Neck and Shoulder Rolls", @"Sleep", @"Drink Water", @"correct posture",@"Drink Tea", @"decrease coffee", @"get 8 hours of sleep", @"safe couphing", nil];
    [self.currentDuration setKeyboardType:UIKeyboardTypeNumberPad];
    self.currentDuration.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitExerciseButton:(id)sender {
    AppDelegate *myAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [myAppDelegate.completeExercises addObject:[self.exerciseNames objectAtIndex:self.arrayVal]];
    [myAppDelegate.duration addObject:self.currentDuration.text];
    self.currentDuration.text = @"";
    NSLog(@"here: %@", myAppDelegate.completeExercises);
    NSLog(@"here: %@", myAppDelegate.duration);
    [self.currentDuration resignFirstResponder];

}

- (IBAction)submitTreatmentButton:(id)sender {
    AppDelegate *myAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    myAppDelegate.days = self.planLength.text;
    NSLog(@"here treatment: %@", myAppDelegate.days);
    
    // Check if Number of Days is entered
    if (self.planLength.text == @"" && [self.planLength.text intValue] < 0) {
        // If not alert the user
        UIAlertView* myalertView = [[UIAlertView alloc]
                                    initWithTitle:@"Days Plan Length"
                                    message:@"Days should be greater than 0."
                                    delegate:self
                                    cancelButtonTitle:@"OK"
                                    otherButtonTitles:nil];
        [myalertView show];
    }
    
    // Inistate self.status with NSMArray of size days*len(pickervalues)
    // Mark all tasks as not-done aka false
    
    NSInteger arrayCount = [self.planLength.text integerValue]*[myAppDelegate.completeExercises count];
    for (int i = 0; i< arrayCount; i++)
    {
        // isChecked values f = false, t = true
        NSString *isChecked = @"f";
        [myAppDelegate.status addObject:isChecked];
    }
    
    UIStoryboard *myStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *myViewController = [myStoryBoard instantiateViewControllerWithIdentifier:@"InitialViewController"];
    [self presentViewController:myViewController animated:YES completion:nil];

}

-(IBAction)goToClinician:(id)sender
{
    UIStoryboard *myStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *myViewController = [myStoryBoard instantiateViewControllerWithIdentifier:@"ClinicianViewController"];
    [self presentViewController:myViewController animated:YES completion:nil];
}



#pragma mark - UIPickerViewDataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{    NSLog(@"::in datasource:numofcomponents");

    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{    NSLog(@"::in datasource:numberOfRowsInComponent");

    return [self.exerciseNames count];
}



#pragma mark - UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{    NSLog(@"::in Delegate:titleForRow");
    return [self.exerciseNames objectAtIndex:row];

}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component

{    NSLog(@"::in Delegate:didSelectRow");
    NSString *temp = [self.exerciseNames objectAtIndex:row];
    self.arrayVal = row;
    NSLog(temp);
}



//textfield delegate

/*
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}
*/

@end
