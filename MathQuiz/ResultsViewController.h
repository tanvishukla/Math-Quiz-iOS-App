//
//  ResultsViewController.h
//  MathQuiz
//
//  Created by Nirupama Prasad on 12/10/16.
//  Copyright © 2016 Nirupama Prasad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsViewController : UIViewController
@property (retain, nonatomic) IBOutlet UILabel *Result;
-(void)setScore:(int *)S;

@end
