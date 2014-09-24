//
//  HTGCGameViewController.m
//  HelloTextGoogleCast
//
//  Created by Michael Ho on 2014-09-20.
//  Copyright (c) 2014 Google Inc. All rights reserved.
//

#import "HTGCGameViewController.h"

#import "JSONKit.h"

@interface HTGCGameViewController () {
    BOOL firstCardOpen;
    BOOL secondCardOpen;
}

@end

@implementation HTGCGameViewController

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
    
    // SET BY SERVER FIRST BEFORE ALL
    self.chips = @1000;
    self.firstCardStr = @"AS";
    self.secondCardStr = @"TS";
    
    // Slider default
    self.raisingSlider.minimumValue = 0;
    self.raisingSlider.maximumValue = self.chips.integerValue;
    self.raisingSlider.value = 0;
    
    [self.raisingLabel setText: [NSString stringWithFormat:@"%d",(int)self.raisingSlider.value]];
    self.raisingSlider.continuous = YES;
    [self.raisingSlider addTarget:self action:@selector(raisingSliderChanged) forControlEvents:UIControlEventValueChanged];

    [self setCards];
    
    [self waitForTurn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)raisingSliderChanged {
    
    // Update raising chips
    NSString *raisingLabelString = [NSString stringWithFormat:@"%d", (int)self.raisingSlider.value];
    [self.raisingLabel setText:raisingLabelString];
    
    // Update chips
    int newChips = self.chips.integerValue - (int)self.raisingSlider.value;
    NSString *chipsLabelString = [NSString stringWithFormat:@"%d", newChips];
    [self.chipsLabel setText:chipsLabelString];
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

- (IBAction)foldAction:(id)sender {
}

- (IBAction)checkAction:(id)sender {
}

- (IBAction)raiseAction:(id)sender {
    
}

#pragma mark - Receiving instructions

- (void)didReceiveMessage:(NSString *)message {
    NSDictionary *dict = [message objectFromJSONString];
}

#pragma mark - Set defaults

- (void)setCards {
    [self.firstCard setImage:[UIImage imageNamed:self.firstCardStr] forState:UIControlStateNormal];
    [self.secondCard setImage:[UIImage imageNamed:self.secondCardStr] forState:UIControlStateNormal];
    firstCardOpen = YES;
    secondCardOpen = YES;
}


- (IBAction)firstCardTapped:(id)sender {
    if(firstCardOpen) {
        firstCardOpen = NO;
        [self.firstCard setImage:[UIImage imageNamed:@"blue"] forState:UIControlStateNormal];
    } else {
        firstCardOpen = YES;
        [self.firstCard setImage:[UIImage imageNamed:self.firstCardStr] forState:UIControlStateNormal];
    }
}

- (IBAction)secondCardTapped:(id)sender {
    if(secondCardOpen) {
        secondCardOpen = NO;
        [self.secondCard setImage:[UIImage imageNamed:@"blue"] forState:UIControlStateNormal];
    } else {
        secondCardOpen = YES;
        [self.secondCard setImage:[UIImage imageNamed:self.secondCardStr] forState:UIControlStateNormal];
    }
}

- (void)waitForTurn {
    [self.turnLabel setText:@"Wait for your turn"];
    [self.turnLabel setTintColor:[UIColor orangeColor]];
    self.foldButton.enabled = NO;
    self.raiseButton.enabled = NO;
    self.checkButton.enabled = NO;
    self.raisingSlider.enabled = NO;
}

#pragma mark - Utilities
- (NSString *)dictToJSON:(NSDictionary *)dict {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:0
                                                         error:nil];
    return [[NSString alloc] initWithBytes:[jsonData bytes] length:[jsonData length] encoding:NSUTF8StringEncoding];
}
@end
