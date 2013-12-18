//
//  ScheduleViewController.m
//  VoiceApp
//
//  Created by Jacus VanHorn on 12/18/13.
//  Copyright (c) 2013 Jacus VanHorn. All rights reserved.
//

#import "ScheduleViewController.h"
#import "AppDelegate.h"


@interface ScheduleViewController ()
@end

@implementation ScheduleViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    AppDelegate *myAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSLog(@"here: now %@" ,myAppDelegate.completeExercises);
}



#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    AppDelegate *myAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    return [myAppDelegate.completeExercises count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *myAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    static NSString *cellName = @"myCell";
    UITableViewCell *myCell;
    
    myCell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (myCell == nil)
    {
        myCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                        reuseIdentifier:cellName];
    }
    
    myCell.textLabel.text = [NSString stringWithFormat:@"%@ Duration: %@",[myAppDelegate.completeExercises objectAtIndex:indexPath.row], [myAppDelegate.duration objectAtIndex:indexPath.row]];
    NSUInteger temp = indexPath.row*indexPath.section;
    NSLog(@":::::::::::::::::%@", [myAppDelegate.status objectAtIndex:temp]);
    
    
    if ([[myAppDelegate.status objectAtIndex:temp] isEqualToString:@"t"])
    {

        myCell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        myCell.accessoryType = UITableViewCellAccessoryNone;
    }

    return myCell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate *myAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSUInteger temp = indexPath.row*indexPath.section;
    if ([[myAppDelegate.status objectAtIndex:temp] isEqualToString:@"t"])
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [myAppDelegate.status setObject:@"f" atIndexedSubscript:temp];
    }
    else
    {
        
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [myAppDelegate.status setObject:@"t" atIndexedSubscript:temp];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    AppDelegate *myAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSLog(@"in sections: %@", myAppDelegate.days);
    return [myAppDelegate.days integerValue];
}


- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Day %d", section+1];
}


@end
