//
//  ViewController.h
//  MathQuiz
//
//  Created by Nirupama Prasad on 12/9/16.
//  Copyright © 2016 Nirupama Prasad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuizViewController.h"

//NSString *PassOpp;
//NSString *PassOpSegue;

@interface ViewController : UIViewController;
@property(nonatomic) NSString *isWhatClicked;
//@property(nonatomic) BOOL *isSubtractionClicked;
//@property(nonatomic) BOOL *isMultiplicationClicked;


@property (weak, nonatomic) IBOutlet UIButton *AdditionButton;
@property (weak, nonatomic) IBOutlet UIButton *Subtraction;
@property (weak, nonatomic) IBOutlet UIButton *Multiplication;


@end

