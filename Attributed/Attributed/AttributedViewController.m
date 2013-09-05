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

- (NSArray *)wordList
{
    NSArray *wordList = [[self.label.attributedText string] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([wordList count]) {
        return wordList;
    } else {
        return @[@""];
    } 
}

- (NSString *)selectedWord
{
    return [self wordList][(int)self.selectedWordStepper.value]; 
}

- (IBAction)updateSelectedWord
{
    self.selectedWordStepper.maximumValue = [[self wordList] count] - 1;
    self.selectedWordLabel.text = [self selectedWord]; 
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateSelectedWord];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
