//
//  ViewController.h
//  OutaTime
//
//  Created by Jennifer Hamilton on 11/9/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProtocolDelegate <NSObject>

- (void)dateWasPicked:(NSDate*)dateSelected;

@end

@interface TimeCircuitsViewController : UIViewController <ProtocolDelegate>

@property (weak, nonatomic) IBOutlet UILabel *destinationTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *presentTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;

- (IBAction)setTimeButton:(UIButton *)sender;

- (IBAction)travelBackButton:(UIButton *)sender;


@end

