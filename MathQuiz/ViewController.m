//
//  ViewController.m
//  MathQuiz
//
//  Created by Nirupama Prasad on 12/9/16.
//  Copyright © 2016 Nirupama Prasad. All rights reserved.
//  Damn Straight

#import "ViewController.h"

@interface ViewController ()

//Declare Pass Variable
@property
(strong,nonatomic)NSString *PassOpp;
@property
(strong,nonatomic)NSString *PassOpSegue;



@end

@implementation ViewController
@synthesize PassOpp;
@synthesize PassOpSegue;



- (void)viewDidLoad {
    [super viewDidLoad];

        self.extendedLayoutIncludesOpaqueBars = NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view, typically from a nib.
}

//Check which button was tapped
//----------------Button Press Check------------------------//
- (IBAction) buttonPressed: (UIButton*) Button{
    if (Button == _AdditionButton)
    {
        NSLog(@"Entered Addition");
        PassOpp = @"a";
        PassOpSegue = @"toQuiz";
        NSLog(@"Value of PassOpp = %@",PassOpp);
    } else if (Button == _Subtraction){
        PassOpp = @"s";
        PassOpSegue = @"toQuizs";
    } else if (Button == _Multiplication){
        NSLog(@"Value of PassOpp = %@",PassOpp);
        PassOpp = @"m";
        NSLog(@"Value of PassOpp = %@",PassOpp);
        PassOpSegue = @"toQuizm";
    }
}
//--------------------Segue to Narnia---------------------------//
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id) sender{
    if([segue.identifier isEqualToString:PassOpSegue]){
        QuizViewController *controller = (QuizViewController *) segue.destinationViewController;
        NSLog(@"Value of PassOpp before = %@",PassOpp);
        [controller setOperators:(NSString *)PassOpp];
        NSLog(@"Value of PassOpp = %@",PassOpp);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
