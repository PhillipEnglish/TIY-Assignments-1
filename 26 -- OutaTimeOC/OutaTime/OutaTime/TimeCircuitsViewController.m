//
//  ViewController.m
//  OutaTime
//
//  Created by Jennifer Hamilton on 11/9/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "TimeCircuitsViewController.h"
#import "DatePickerViewController.h"

@interface TimeCircuitsViewController ()

@end

@implementation TimeCircuitsViewController

/*
  
 present time = nsdate()
 dest time = nil
 last time = nil
 
 press set time button
 send destination time to label via datePicker delegate
 
 press travel back button
 start timer and set value of timer to the speed label
 when timer/speed hits 88,
 
 present time = dest time
 dest time = nil (until another date picked)
 last time = present time

 when setTime is pressed again, speed = "--" && timer = 0
 
 */





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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}

- (void)dateWasPicked:(NSDate*)dateSelected;
{
    
}

- (NSString*)formatDate:(NSDate*)rawDate;
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM dd, yyyy"];
    
    NSString *dateString = [dateFormatter stringFromDate:rawDate];
    return [dateString uppercaseString];
    
}

- (IBAction)setTimeButton:(id)sender
{
    
}

- (IBAction)travelBackButton:(UIButton *)sender
{
    
}
@end
