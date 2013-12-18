//
//  AppDelegate.h
//  VoiceApp
//
//  Created by Jacus VanHorn on 10/1/13.
//  Copyright (c) 2013 Jacus VanHorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (retain, nonatomic) NSMutableArray *completeExercises;
@property (retain, nonatomic) NSMutableArray *duration;
@property (retain, nonatomic) NSMutableArray *status;

@property (retain, nonatomic) NSString *days;

@property (retain, nonatomic) NSString *clinEmail;
@property (retain, nonatomic) NSString *clinName;
@property (retain, nonatomic) NSString *clName;
@property (retain, nonatomic) NSString *clEmail;

@end
