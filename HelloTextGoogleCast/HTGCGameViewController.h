//
//  HTGCGameViewController.h
//  HelloTextGoogleCast
//
//  Created by Michael Ho on 2014-09-20.
//  Copyright (c) 2014 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleCast/GoogleCast.h>
#import "HTGCTextChannel.h"

@interface HTGCGameViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *raisingLabel;
@property (weak, nonatomic) IBOutlet UISlider *raisingSlider;

@property (weak, nonatomic) IBOutlet UILabel *potLabel;
@property (weak, nonatomic) IBOutlet UILabel *chipsLabel;

@property (weak, nonatomic) IBOutlet UILabel *turnLabel;

@property (weak, nonatomic) IBOutlet UIButton *foldButton;
@property (weak, nonatomic) IBOutlet UIButton *checkButton;
@property (weak, nonatomic) IBOutlet UIButton *raiseButton;

- (IBAction)foldAction:(id)sender;
- (IBAction)checkAction:(id)sender;
- (IBAction)raiseAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *firstCard;
@property (weak, nonatomic) IBOutlet UIButton *secondCard;

- (IBAction)firstCardTapped:(id)sender;
- (IBAction)secondCardTapped:(id)sender;

@property GCKDevice *selectedDevice;
@property HTGCTextChannel *textChannel;
@property (strong, nonatomic) NSDictionary *cards;

- (void)didReceiveMessage:(NSString *)message;

@property (strong, nonatomic) NSNumber *pot;
@property (strong, nonatomic) NSNumber *chips;
@property (strong, nonatomic) NSString *firstCardStr;
@property (strong, nonatomic) NSString *secondCardStr;


@end
