//
//  ViewController.m
//  CheckBox
//
//  Created by Tecksky Techonologies on 1/7/17.
//  Copyright © 2017 Tecksky Technologies. All rights reserved.
//

#import "ViewController.h"
#import "BEMCheckBox.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet BEMCheckBox *checkbox;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.checkbox.onAnimationType = BEMAnimationTypeBounce;
    self.checkbox.offAnimationType = BEMAnimationTypeBounce;
    
}

- (void)didTapCheckBox:(BEMCheckBox*)checkBox
{
    NSLog(@"checked");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
