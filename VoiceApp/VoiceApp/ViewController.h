//
//  ViewController.h
//  VoiceApp
//
//  Created by Jacus VanHorn on 10/1/13.
//  Copyright (c) 2013 Jacus VanHorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>
{

}

@property (weak, nonatomic) IBOutlet UIPickerView *myPicker;
@property (retain, nonatomic) NSArray *exerciseNames;
@property (weak, nonatomic) NSString *currentExercise;
@property (nonatomic) NSInteger arrayVal;
@property (weak, nonatomic) IBOutlet UITextField *currentDuration;
@property (weak, nonatomic) IBOutlet UITextField *planLength;



- (IBAction)submitExerciseButton:(id)sender;
- (IBAction)submitTreatmentButton:(id)sender;



-(IBAction)goToClinician:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *mySecret;

@end


