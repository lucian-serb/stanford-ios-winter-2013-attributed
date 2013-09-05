//
//  AttributedViewController.m
//  Attributed
//
//  Created by Andrei-Lucian Șerb on 9/5/13.
//  Copyright (c) 2013 Andrei-Lucian Șerb. All rights reserved.
//

#import "AttributedViewController.h"

@interface AttributedViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *selectedWordLabel;
@property (weak, nonatomic) IBOutlet UIStepper *selectedWordStepper;

@end

@implementation AttributedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
