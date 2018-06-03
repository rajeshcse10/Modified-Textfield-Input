//
//  ViewController.m
//  LiveTracking
//
//  Created by Rajesh Karmaker on 28/5/18.
//  Copyright © 2018 Rajesh Karmaker. All rights reserved.
//

#import "ViewController.h"
#import "MyTextFieldUtils.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dTextField.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnPressed:(id)sender {
    [self.dTextField resignFirstResponder];
}


#pragma mark UITextFieldDelegate methods
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    string = [MyTextFieldUtils convertToDeviceString:string];
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (!newString.length) {
        return YES;
    }
    NSRegularExpression *regEx  = [MyTextFieldUtils createLocalizedRegEx];
    NSUInteger numberOfMatches  = [regEx numberOfMatchesInString:newString options:0 range:NSMakeRange(0, [newString length])];
    if(numberOfMatches == 0) return NO;
    [self.dTextField setText:newString];
    
    //NSNumberFormatter *formatter = [MyTextFieldUtils getFormatterWithLocale:[MyTextFieldUtils getKeyboardLocale]];
    
    return NO;
}

@end
