//
//  ResultsViewController.m
//  MathQuiz
//
//  Created by Nirupama Prasad on 12/10/16.
//  Copyright © 2016 Nirupama Prasad. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController
@synthesize Result;

//--------------Screen Rotation Handling-------------------------------//
-(void) changedView{
    UIInterfaceOrientation theOrientation = self.interfaceOrientation;
    if ((theOrientation == UIInterfaceOrientationLandscapeLeft)||(theOrientation == UIInterfaceOrientationLandscapeRight)){
        Result.frame    = CGRectMake(198,115,43,76);
    }else{
        Result.frame    = CGRectMake(198,115,43,76);
    }
}
-(void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [self changedView];
}
//--------------------------------------------------------------------//

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//------------Sets Score or Something :P-------------------------------//
- (void)  setScore:(int *)S{
    self.Result = [[UILabel alloc] init];
    dispatch_async(dispatch_get_main_queue(), ^{
    NSLog(@"Value of score %d",S);
   
        [self.Result setText:[NSString stringWithFormat:@"%d",S]];});
}
//---------------------------------------------------------------------//
@end
