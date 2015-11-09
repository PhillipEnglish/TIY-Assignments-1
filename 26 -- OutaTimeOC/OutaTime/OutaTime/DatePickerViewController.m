//
//  DatePickerViewController.m
//  OutaTime
//
//  Created by Jennifer Hamilton on 11/9/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)datePicker:(UIDatePicker *)sender
{
//    delegate?.destinationDateWasChosen(picker.date)    
    [self.delegate dateWasPicked: sender.date];
}
@end
