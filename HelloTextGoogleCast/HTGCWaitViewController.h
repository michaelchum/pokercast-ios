//
//  HTGCWaitViewController.h
//  HelloTextGoogleCast
//
//  Created by Michael Ho on 2014-09-20.
//  Copyright (c) 2014 Google Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleCast/GoogleCast.h>

#import "HTGCTextChannel.h"

@interface HTGCWaitViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *waitLabel;
@property (weak, nonatomic) IBOutlet UILabel *waitDotLabel;
@property (weak, nonatomic) IBOutlet UIButton *startGameButton;
- (IBAction)startGameAction:(id)sender;

@property GCKDevice *selectedDevice;
@property HTGCTextChannel *textChannel;

- (void)didReceiveMessage:(NSString *)message;

@end
