//
//  QuizViewController.h
//  MathQuiz
//
//  Created by Nirupama Prasad on 12/10/16.
//  Copyright © 2016 Nirupama Prasad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultsViewController.h"


@interface QuizViewController : UIViewController{
    NSString *op;
    //IBOutlet UILabel *Operand1;
}
@property (retain, nonatomic) IBOutlet UILabel *QuesNo;
@property (nonatomic, retain) IBOutlet UILabel *Operand1;
@property (nonatomic, retain) IBOutlet UILabel *Operator;
@property (nonatomic, retain) IBOutlet UILabel *Operand2;

- (void) setOperators:(NSString *)O;


//- (IBAction)Numpad0:(id)sender;
@property (nonatomic, retain) IBOutlet UILabel *TimerLabel;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *Backbutton;
@property (strong,nonatomic)IBOutlet UIButton*ButtonN;
@property (weak, nonatomic) IBOutlet UIButton *Numpad0;
@property (weak, nonatomic) IBOutlet UINavigationBar *NavBar;
@property (weak, nonatomic) IBOutlet UIButton *Numpad1;
@property (weak, nonatomic) IBOutlet UIButton *Numpad2;
@property (weak, nonatomic) IBOutlet UIButton *Numpad3;
@property (weak, nonatomic) IBOutlet UIButton *Numpad4;
@property (weak, nonatomic) IBOutlet UIButton *Numpad5;
@property (weak, nonatomic) IBOutlet UIButton *Numpad6;
@property (weak, nonatomic) IBOutlet UIButton *Numpad7;
@property (weak, nonatomic) IBOutlet UIButton *Numpad8;
@property (weak, nonatomic) IBOutlet UIButton *Numpad9;
@property (weak, nonatomic) IBOutlet UIButton *Next;
@property (weak, nonatomic) IBOutlet UIProgressView *Progress;
@property (weak, nonatomic) IBOutlet UILabel *Answer;
@end
