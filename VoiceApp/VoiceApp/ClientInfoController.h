//
//  ClientInfoController.h
//  VoiceApp
//
//  Created by Jacus VanHorn on 12/16/13.
//  Copyright (c) 2013 Jacus VanHorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClientInfoController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *clinicianName;

@property (weak, nonatomic) IBOutlet UITextField *ClinicianEmail;

@property (weak, nonatomic) IBOutlet UITextField *ClientName;

@property (weak, nonatomic) IBOutlet UITextField *ClientEmail;

- (IBAction)infoNextButton:(id)sender;

@end
