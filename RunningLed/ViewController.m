//
//  ViewController.m
//  RunningLed
//
//  Created by Hoang Ngoc Tung on 30/10/2015.
//  Copyright (c) Năm 2015 HoangNgocTung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CGFloat _magrin;
    int _numberOfBall;
    CGFloat _diameter;
    CGFloat _space;
    NSTimer * _timer;
    int lastOnLed;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _magrin =40;
    _diameter =24;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(runningLed) userInfo:nil repeats:true];
    _numberOfBall =8;
    lastOnLed =0;
    [self drawOfBall:_numberOfBall];
}
-(void)runningLed {
    if (lastOnLed != _numberOfBall) {
        [self turnOffLed:lastOnLed];
    }
    
    if (lastOnLed != 0) {
        lastOnLed--;
    } else {
        lastOnLed = _numberOfBall-1;
    }
    [self turnOnLed:lastOnLed];
}

-(void) turnOnLed: (int) index {
    UIView* view = [self.view viewWithTag:index +100];
    if (view && [view isMemberOfClass:[UIImageView class]]) {
        UIImageView* ball = (UIImageView*) view;
        ball.image = [UIImage imageNamed:@"green"];
    }
}
-(void) turnOffLed: (int) index {
    UIView* view = [self.view viewWithTag:index +100];
    if (view && [view isMemberOfClass:[UIImageView class]]) {
        UIImageView* ball = (UIImageView*) view;
        ball.image = [UIImage imageNamed:@"gray"];
    }
}
- (void)placeBallAtX: (CGFloat) x
                andY: (CGFloat) y
             withTag: (int) tag {
    UIImageView* ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gray"]];
    ball.center = CGPointMake(x, y);
    ball.tag = tag;
    [self.view addSubview:ball];
}
-(CGFloat) spaceBetweenBall: (int) n {
    return (self.view.bounds.size.width - 2 * _magrin) / (n-1);
}
-(void) drawOfBall: (int) numberBalls {
    CGFloat space = [self spaceBetweenBall:_numberOfBall];
    for (int i=0; i< numberBalls; i++) {
        [self placeBallAtX: _magrin + i*space
                      andY:150
                   withTag:i+100];
    }
}
@end
