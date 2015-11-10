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

NSInteger *currentSpeed = 0;
NSTimer *timer;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setPresentTimeLabel];
    [self updateUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segue & Delegate call

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowDatePickerSegue"])
    {
        DatePickerViewController *timeVC = (DatePickerViewController *)[segue destinationViewController];
        timeVC.delegate = self;

    }
}

#pragma mark - Action Handlers

- (IBAction)setTimeButton:(UIButton *)sender
{
    
}

- (IBAction)travelBackButton:(UIButton *)sender
{
    // TODO: not working
    [self startTimer];
}

#pragma mark - Timer Methods

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

#pragma mark - Set Labels & View

- (NSString*)formatDate:(NSDate*)rawDate;
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM dd, yyyy"];
    
    NSString *dateString = [dateFormatter stringFromDate:rawDate];
    return [dateString uppercaseString];
}

- (void)setPresentTimeLabel
{
    self.presentTimeLabel.text = [self formatDate: [NSDate date]];
}

- (void)dateWasPicked:(NSDate*)dateSelected;
{
    self.destinationTimeLabel.text = [self formatDate: dateSelected];
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
    // TODO: this is weird
    if (*newCount == 88)
    {
        [self stopTimer];
        [self setLastTimeLabel];
        currentSpeed = 0;
        self.speedLabel.text = [NSString stringWithFormat:@"%ld MPH", (long)currentSpeed];
    }
}

@end

