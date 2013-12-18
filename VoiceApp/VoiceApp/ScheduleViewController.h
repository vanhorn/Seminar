//
//  ScheduleViewController.h
//  VoiceApp
//
//  Created by Jacus VanHorn on 12/18/13.
//  Copyright (c) 2013 Jacus VanHorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *myTable;

@end
