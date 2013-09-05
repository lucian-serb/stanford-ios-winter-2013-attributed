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

- (void)addLabelAttributes:(NSDictionary *)attributes forRange:(NSRange)range
{
    if (range.location != NSNotFound) {
        NSMutableAttributedString *mat = [self.label.attributedText mutableCopy];
        [mat addAttributes:attributes range:range];
        self.label.attributedText = mat;
    }
}

- (void)addSelectedWordAttributes:(NSDictionary *)attributes
{
    NSRange range = [[self.label.attributedText string] rangeOfString:[self selectedWord]];
    [self addLabelAttributes:attributes forRange:range];
}

- (IBAction)underline
{
    [self addSelectedWordAttributes:@{NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle)}];
}

- (IBAction)unUnderline
{
    [self addSelectedWordAttributes:@{NSUnderlineStyleAttributeName  : @(NSUnderlineStyleNone)}];
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
