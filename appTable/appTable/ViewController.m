//
//  ViewController.m
//  appTable
//
//  Created by Kaique Damato on 2/25/15.
//  Copyright (c) 2015 Kaique Damato. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)botaoVoltar:(id)sender {
   
    [self dismissViewControllerAnimated:true completion:nil];
}
@end
