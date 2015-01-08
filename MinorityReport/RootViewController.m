//
//  ViewController.m
//  MinorityReport
//
//  Created by Gustavo Couto on 2015-01-08.
//  Copyright (c) 2015 Gustavo Couto. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (weak, nonatomic) IBOutlet UILabel *futureLabel;
@property (weak, nonatomic) IBOutlet UILabel *precogsLabel;
@property NSString *futureLabelOriginalText;
@property CGPoint futureLabelOriginalCenter;
@property UIColor *futureLabelOriginalColor;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.futureLabelOriginalCenter = self.futureLabel.center;
    self.futureLabelOriginalColor = self.futureLabel.backgroundColor;
    self.futureLabelOriginalText = self.futureLabel.text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)panHandler:(UIPanGestureRecognizer *)gesture
{
    CGPoint touch = [gesture locationInView:self.view];
    self.futureLabel.center = touch;


    if (CGRectContainsPoint(self.precogsLabel.frame, self.futureLabel.center) )
    {
        self.futureLabel.text = @"A Ficticius and Incriminating Future";
        self.futureLabel.backgroundColor = [UIColor redColor];
        [self.futureLabel sizeToFit];
    }

    if (gesture.state == UIGestureRecognizerStateEnded)
    {
        [UIView animateWithDuration:.5 animations:^
         {
             self.futureLabel.center = self.futureLabelOriginalCenter;
         }];
    }
    
    
}

@end
