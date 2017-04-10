//
//  QuizViewController.m
//  MathQuiz
//
//  Created by Nirupama Prasad on 12/10/16.
//  Copyright © 2016 Nirupama Prasad. All rights reserved.
//

#import "QuizViewController.h"
#import "ViewController.h"
@interface QuizViewController ()

@end


@implementation QuizViewController
//@synthesize Operand1;
@synthesize Numpad0;
@synthesize Numpad1;
@synthesize Numpad2;
@synthesize Numpad3;
@synthesize Numpad4;
@synthesize Numpad5;
@synthesize Numpad6;
@synthesize Numpad7;
@synthesize Numpad8;
@synthesize Numpad9;
@synthesize Next;

int qno=1;
int r, r2;
int Ans;
int digit;
int correct=-1;
int score=0;
NSTimer *timer;
int remainingcounts; //why static?
//--------------Screen Rotation Handling-------------------------------//
-(void) changedView{
    UIInterfaceOrientation theOrientation = self.interfaceOrientation;
    if ((theOrientation == UIInterfaceOrientationLandscapeLeft)||(theOrientation == UIInterfaceOrientationLandscapeRight)){
        Numpad0.frame = CGRectMake(259,219,44,49);
        Numpad1.frame = CGRectMake(206,58,45,49);
        Numpad2.frame = CGRectMake(264,60,41,45);
        Numpad3.frame = CGRectMake(313,56,49,50);
        Numpad4.frame = CGRectMake(206,109,42,50);
        Numpad5.frame = CGRectMake(264,116,51,45);
        Numpad6.frame = CGRectMake(313,116,50,46);
        Numpad7.frame = CGRectMake(206,173,45,30);
        Numpad8.frame = CGRectMake(262,174,45,43);
        Numpad9.frame = CGRectMake(315,170,45,46);
        Next.frame    = CGRectMake(216,260,136,52);
    }else{
        Numpad0.frame = CGRectMake(126,454,35,41);
        Numpad1.frame = CGRectMake(63,300,46,27);
        Numpad2.frame = CGRectMake(125,300,46,27);
        Numpad3.frame = CGRectMake(189,300,46,27);
        Numpad4.frame = CGRectMake(63,348,46,25);
        Numpad5.frame = CGRectMake(125,341,46,37);
        Numpad6.frame = CGRectMake(189,343,46,35);
        Numpad7.frame = CGRectMake(63,395,46,35);
        Numpad8.frame = CGRectMake(125,395,46,35);
        Numpad9.frame = CGRectMake(197,389,31,47);
        Next.frame    = CGRectMake(61,478,173,50);
    }
}
-(void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [self changedView];
}
//--------------------------------------------------------------------//

- (void)viewDidLoad {
    [super viewDidLoad];
                qno=1;
               dispatch_async(dispatch_get_main_queue(), ^{
                });
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//--------------------------Receives Operation ID from segue and starts quiz--------//
- (void)setOperators:(NSString *)O{
    self.Operand1 = [[UILabel alloc] init];
    self.Operator = [[UILabel alloc] init];
    self.Operand2 = [[UILabel alloc] init];
    self.QuesNo = [[UILabel alloc] init];
    self.TimerLabel = [[UILabel alloc] init];
   NSString *Oper=@"a";
    NSString *Oper2=@"s";
    NSString *Oper3=@"m";
        if ([O isEqualToString:Oper]){
                dispatch_async(dispatch_get_main_queue(), ^{
            qno =1;
                r = arc4random_uniform(10);
                r2 = arc4random_uniform(10);
                correct = r+r2;
             

        [self.QuesNo setText:[NSString stringWithFormat:@"%d.",qno]];
        [self.Operator setText:[NSString stringWithFormat:@"+"]];
        [self.Operand1 setText:[NSString stringWithFormat:@"%d",r]];
        [self.Operand2 setText:[NSString stringWithFormat:@"%d",r2]];

        });

    }else if ([O isEqualToString:Oper2]){
         dispatch_async(dispatch_get_main_queue(), ^{
  
             r = arc4random_uniform(10);
             r2 = arc4random_uniform(10);
             if (r2>r){
                 int temp1 =r2;
                 r2=r;
                 r=temp1;
             }
        self.QuesNo.text = [NSString stringWithFormat:@"%d.",qno];
        self.Operator.text = [NSString stringWithFormat:@"-"];
        self.Operand1.text = [NSString stringWithFormat:@"%d",r];
                 self.Operand2.text = [NSString stringWithFormat:@"%d",r2];
                     self.Answer.text = [NSString stringWithFormat:@"%d",Ans];
             
             
             });
    }else if ([O isEqualToString:Oper3]){
        dispatch_async(dispatch_get_main_queue(), ^{
            r = arc4random_uniform(10);
            r2 = arc4random_uniform(10);
        self.Operator.text = [NSString stringWithFormat:@"X"];
        self.Operand1.text = [NSString stringWithFormat:@"%d",r];
        self.Operand2.text = [NSString stringWithFormat:@"%d",r2];
        });
    }
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1
                                             target:self
                                           selector:@selector(countDown)
                                           userInfo:nil
                                            repeats:YES];
    remainingcounts = 5;
}

//--------------------------------------------------------------------//
//-----------------------Timer fn def starts here---------------------//
-(void)countDown {
   NSLog(@"Value of Timer = %d",remainingcounts);
    [self.TimerLabel setText:[NSString stringWithFormat:@"%d",remainingcounts]];
    if ([_Operator.text isEqualToString: @"+"]){
        correct = r+r2;
    }
    else if([_Operator.text isEqualToString: @"-"]){
        correct = r-r2;
    }
    else if([_Operator.text isEqualToString: @"X"]){
        correct = r*r2;
    }
    if (Ans == correct){
        //Countdown answer check
        NSLog(@"Countdown answer check");
        NSLog(@"Correct");
        NSLog(@"%d",qno);
        if(qno > 10){
            qno =1;
            [timer invalidate];
            [self performSegueWithIdentifier:@"toScore" sender:self];
        }
        self.Answer.text = [NSString stringWithFormat:@"?"];
        remainingcounts=5;
        [self.TimerLabel setText:[NSString stringWithFormat:@"%d",remainingcounts]];
        qno++;
        r = arc4random_uniform(10);
        r2 = arc4random_uniform(10);
        if([_Operator.text isEqualToString: @"-"]){
            if (r2>r){
                int temp1 =r2;
                r2=r;
                r=temp1;
            }
        }
        
        score++;
        if(qno>10){
            qno = 1;
            [self performSegueWithIdentifier:@"toScore" sender:self];
        }
        self.QuesNo.text = [NSString stringWithFormat:@"%d.",qno];
        self.Operand1.text = [NSString stringWithFormat:@"%d",r];
        self.Operand2.text = [NSString stringWithFormat:@"%d",r2];
        Ans = -1;
        self.Answer.text = @"?";
        NSLog(@"Score %d",score);
        NSString *message = @"Correct!";
        
        UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:nil, nil];
        [toast show];
        
        int duration = 0.1; // duration in seconds

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [toast dismissWithClickedButtonIndex:0 animated:YES];
        });


    }
        if (--remainingcounts == -1) {
        qno++;
            NSString *message;
            if (Ans==correct){
                message =@"Correct!";
            }else{
                message =@"Wrong";
            }
            UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:nil, nil];
            [toast show];
            int duration = 0.1; // duration in seconds
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                [toast dismissWithClickedButtonIndex:0 animated:YES];
            });

        if(qno > 10){
            qno = 1;
            [self performSegueWithIdentifier:@"toScore" sender:self];
            [timer invalidate];
        }
        self.Answer.text = [NSString stringWithFormat:@"?"];
        remainingcounts=5;
        [self.TimerLabel setText:[NSString stringWithFormat:@"%d",remainingcounts]];
        r = arc4random_uniform(10);
        r2 = arc4random_uniform(10);
        if([_Operator.text isEqualToString: @"-"]){
            if (r2>r){
                int temp1 =r2;
                r2=r;
                r=temp1;
            }
        }
        self.QuesNo.text = [NSString stringWithFormat:@"%d.",qno];
        self.Operand1.text = [NSString stringWithFormat:@"%d",r];
        self.Operand2.text = [NSString stringWithFormat:@"%d",r2];
        Ans = -1;
        self.Answer.text = @"?";
    }
}
//-----------------------Button Click Action-------------------------//
- (IBAction) buttonPressed2:(UIButton*) ButtonN{

    NSLog(@"Correct %d",correct);
    if(ButtonN==Next){
        remainingcounts = 5;
        if ([_Operator.text isEqualToString: @"+"]){
        correct = r+r2;
        }
        else if([_Operator.text isEqualToString: @"-"]){
            correct = r-r2;
        }
        else if([_Operator.text isEqualToString: @"X"]){
            correct = r*r2;
        }NSString *message = @"Wrong";
        
        UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:nil, nil];
        
        int duration = 1; // duration in seconds
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [toast dismissWithClickedButtonIndex:0 animated:YES];
        });
        if(Ans == correct){
            score++;
            NSString *message = @"Correct!";
            qno++;
            if(qno > 11){
                qno =1;
                [self performSegueWithIdentifier:@"toScore" sender:ButtonN];
            }
            self.Answer.text = [NSString stringWithFormat:@"?"];
            r = arc4random_uniform(10);
            r2 = arc4random_uniform(10);
            if (r>r2){}
            else{
                int temp1 =r2;
                r2=r;
                r=temp1;
            }
            self.QuesNo.text = [NSString stringWithFormat:@"%d.",qno];
            self.Operand1.text = [NSString stringWithFormat:@"%d",r];
            self.Operand2.text = [NSString stringWithFormat:@"%d",r2];
            Ans = -1;
            self.Answer.text = @"?";
            
            UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:nil, nil];
            [toast show];
            int duration = 0.1; // duration in seconds
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                [toast dismissWithClickedButtonIndex:0 animated:YES];
            });

    }
        else{
            NSString *message = @"Wrong";
            
            UIAlertView *toast = [[UIAlertView alloc] initWithTitle:nil
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:nil, nil];
            [toast show];
            
            int duration = 0.1; // duration in seconds
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                [toast dismissWithClickedButtonIndex:0 animated:YES];
            });}
        
            qno++;
            if(qno >= 11){
                qno = 1;
                [self performSegueWithIdentifier:@"toScore" sender:ButtonN];
            }
            self.Answer.text = [NSString stringWithFormat:@"?"];
            r = arc4random_uniform(10);
            r2 = arc4random_uniform(10);
            if (r>r2){}
            else{
                int temp1 =r2;
                r2=r;
                r=temp1;
            }
            self.QuesNo.text = [NSString stringWithFormat:@"%d.",qno];
            self.Operand1.text = [NSString stringWithFormat:@"%d",r];
            self.Operand2.text = [NSString stringWithFormat:@"%d",r2];
        //correct = -2;
        Ans = -1;
        self.Answer.text = @"?";
 //       }
        
        
    }else if(ButtonN==Numpad1){
        if([_Answer.text isEqualToString:@"?"]){
            Ans = 1;
        }else {
            digit=[_Answer.text integerValue];
            Ans = digit * 10 + 1;
            
        }
        self.Answer.text = [NSString stringWithFormat:@"%d",Ans];
        
    }else if(ButtonN==Numpad2){
        if([_Answer.text isEqualToString:@"?"]){
            Ans = 2;
        }else {
            digit=[_Answer.text integerValue];
            Ans = digit * 10 + 2;
        }
        self.Answer.text = [NSString stringWithFormat:@"%d",Ans];
    }else if(ButtonN==Numpad3){
        if([_Answer.text isEqualToString:@"?"]){
            Ans = 3;
        }else {
            digit=[_Answer.text integerValue];
            Ans = digit * 10 + 3;
        }
        self.Answer.text = [NSString stringWithFormat:@"%d",Ans];
    }else if(ButtonN==Numpad4){
        if([_Answer.text isEqualToString:@"?"]){
            Ans = 4;
        }else {
            digit=[_Answer.text integerValue];
            Ans = digit * 10 + 4;
        }
        self.Answer.text = [NSString stringWithFormat:@"%d",Ans];
    }else if(ButtonN==Numpad5){
        if([_Answer.text isEqualToString:@"?"]){
            Ans = 5;
        }else {
            digit=[_Answer.text integerValue];
            Ans = digit * 10 + 5;
        }
        self.Answer.text = [NSString stringWithFormat:@"%d",Ans];
    }else if(ButtonN==Numpad6){
        if([_Answer.text isEqualToString:@"?"]){
            Ans = 6;
        }else {
            digit=[_Answer.text integerValue];
            Ans = digit * 10 + 6;
        }
        self.Answer.text = [NSString stringWithFormat:@"%d",Ans];
    }else if(ButtonN==Numpad7){
        if([_Answer.text isEqualToString:@"?"]){
            Ans = 7;
        }else {
            digit=[_Answer.text integerValue];
            Ans = digit * 10 + 7;
        }
        self.Answer.text = [NSString stringWithFormat:@"%d",Ans];
    }else if(ButtonN==Numpad8){
        if([_Answer.text isEqualToString:@"?"]){
            Ans = 8;
        }else {
            digit=[_Answer.text integerValue];
            Ans = digit * 10 + 8;
        }
        self.Answer.text = [NSString stringWithFormat:@"%d",Ans];
    }else if(ButtonN==Numpad9){
        if([_Answer.text isEqualToString:@"?"]){
            Ans = 9;
        }else {
            digit=[_Answer.text integerValue];
            Ans = digit * 10 + 9;
        }
        self.Answer.text = [NSString stringWithFormat:@"%d",Ans];
    }else if(ButtonN==Numpad0){
        if([_Answer.text isEqualToString:@"?"]){
            Ans = 0;
        }else {
            digit=[_Answer.text integerValue];
            Ans = digit * 10;
        }
        self.Answer.text = [NSString stringWithFormat:@"%d",Ans];
    }
    if (Ans == correct){
        remainingcounts=0;
    }
    //});
}
//---------------------------Prepare for Segue-----------------------------------------//
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id) sender{
    if([segue.identifier isEqualToString:@"toScore"]){
        ResultsViewController *controller = (ResultsViewController *) segue.destinationViewController;
        [controller setScore:(int *)score];
    }
}
//---------------------------Navigation Handling--------------------------------------//
-(IBAction)NavBack:(UIButton *) bButton{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Exit Quiz" message:@"Are you sure?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Yes", nil];
    [alert show];
}
//---------------------------Quiz quit warning---------------------------------------//
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        [timer invalidate];
        [self performSegueWithIdentifier:@"toQuiz" sender:self];
        buttonIndex = 0;
        
    }}


@end
