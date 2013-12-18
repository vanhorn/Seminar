//
//  ProgressViewController.h
//  VoiceApp
//
//  Created by Jacus VanHorn on 12/18/13.
//  Copyright (c) 2013 Jacus VanHorn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
@interface ProgressViewController : UIViewController <MFMailComposeViewControllerDelegate>
- (IBAction)sendButtone:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *ProgressLabel;
@end
