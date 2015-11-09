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

NSInteger *currentSpeed;
NSTimer *timer;


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    currentSpeed = 0;
    [self setPresentTimeLabel];
    [self updateUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowDatePickerSegue"])
    {
        TimeCircuitsViewController *timeVC = (DatePickerViewController *)[segue destinationViewController];
//  SWIFTY     datePickerVC.delegate = self
//        [self [delegate datePickerVC]];
        timeVC.delegate = self;

    }
}

- (void)dateWasPicked:(NSDate*)dateSelected;
{
    self.destinationTimeLabel.text = [self formatDate: dateSelected];
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
    [self startTimer];
}

- (void)setPresentTimeLabel
{
    self.presentTimeLabel.text = [self formatDate: [NSDate date]];
}

- (void)startTimer
{
    if (timer != nil)
    {
        [NSTimer scheduledTimerWithTimeInterval: 0.1
                                          target: self
                                        selector: @selector(updateUI)
                                        userInfo: nil
                                         repeats: NO];
    }
    else
    {
        [self stopTimer];
    }
}

- (void)stopTimer
{
    [timer invalidate];
    timer = nil;
    self.speedLabel.text = [NSString stringWithFormat:@"%ld MPH", (long)currentSpeed];
}

- (void)setLastTimeLabel
{
    self.lastTimeLabel.text = self.destinationTimeLabel.text;
    
}

- (void)updateUI
{
    NSInteger *newCount = currentSpeed;
    currentSpeed = newCount + 1;
    self.speedLabel.text = [NSString stringWithFormat:@"%ld MPH", (long)currentSpeed];
    
    if (*newCount == 88)
    {
        [self stopTimer];
        [self setLastTimeLabel];
        currentSpeed = 0;
        self.speedLabel.text = [NSString stringWithFormat:@"%ld MPH", (long)currentSpeed];
    }

}

@end

