//
//  DatePickerViewController.h
//  OutaTime
//
//  Created by Jennifer Hamilton on 11/9/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeCircuitsViewController.h"

@interface DatePickerViewController : UIViewController

- (IBAction)datePicker:(UIDatePicker *)sender;

// create delegate instance

@property (strong, nonatomic) id <ProtocolDelegate> delegate;

@end
