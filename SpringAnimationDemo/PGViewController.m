//
//  PGViewController.m
//  SpringAnimationDemo
//
//  Created by Henry on 5/11/14.
//  Copyright (c) 2014 pg. All rights reserved.
//

#import "PGViewController.h"

@interface PGViewController ()
@property (weak, nonatomic) IBOutlet UIView *viewToAnimate;
@property (nonatomic) CGFloat dampingRatio;
@property (nonatomic) CGFloat velocity;
@property (weak, nonatomic) IBOutlet UILabel *dampingRatioLabel;
@property (weak, nonatomic) IBOutlet UILabel *velocityLabel;
@property (nonatomic) CGRect initPosition;
@end

@implementation PGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dampingRatio = 0.5;
    self.velocity = 0.5;
    self.initPosition = self.viewToAnimate.frame;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self animate];

}

- (IBAction)dampingRatioChagne:(UISlider*)sender {
    self.dampingRatio = sender.value;
    self.dampingRatioLabel.text = [@(sender.value) description];
}
- (IBAction)velocityLabelChange:(UISlider*)sender {
    self.velocity = sender.value;
    self.velocityLabel.text = [@(sender.value) description];
}

- (IBAction)goButtonTapped:(id)sender {
    [self animate];
}


- (void)animate{
    self.viewToAnimate.frame = self.initPosition;
	// Do any additional setup after loading the view, typically from a nib.
    [UIView animateWithDuration:1.5 delay:0 usingSpringWithDamping:self.dampingRatio initialSpringVelocity:self.velocity options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.viewToAnimate.frame = CGRectMake(self.view.frame.size.width/2, 300, 60, 60);
    } completion:^(BOOL finished) {
        self.viewToAnimate.frame = self.initPosition;
    }];
}

@end
