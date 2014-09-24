//
//  HTGCWaitViewController.m
//  HelloTextGoogleCast
//
//  Created by Michael Ho on 2014-09-20.
//  Copyright (c) 2014 Google Inc. All rights reserved.
//

#import "HTGCWaitViewController.h"
#import "HTGCGameViewController.h"
#import "JSONKit.h"

@interface HTGCWaitViewController ()

@end

@implementation HTGCWaitViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.startGameButton.enabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)startGameAction:(id)sender {
    [self.textChannel sendTextMessage:[self dictToJSON:@{@"START":@"NOOB"}]];
    [self performSegueWithIdentifier:@"startGame" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    HTGCGameViewController *gameViewController = segue.destinationViewController;
    
    NSLog(@"prepareForSegue: %@", segue.identifier);
    if([segue.identifier isEqualToString:@"startGame"]) {
        [self.textChannel setDelegate:segue.destinationViewController];
        gameViewController.selectedDevice = self.selectedDevice;
        gameViewController.textChannel = self.textChannel;
    }
}

-(void)didReceiveMessage:(NSString *)message {
    NSLog(@"%@",message);
    if ([message isEqualToString:@"START"]) {
        self.startGameButton.enabled = YES;
    } else if ([message isEqualToString:@"BEGIN"]) {
        [self performSegueWithIdentifier:@"startGame" sender:self];
    }
}

- (NSString *)dictToJSON:(NSDictionary *)dict {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:0
                                                         error:nil];
    return [[NSString alloc] initWithBytes:[jsonData bytes] length:[jsonData length] encoding:NSUTF8StringEncoding];
}

@end
