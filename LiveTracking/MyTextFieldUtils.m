//
//  MyTextFieldUtils.m
//  LiveTracking
//
//  Created by Rajesh Karmaker on 3/6/18.
//  Copyright © 2018 Rajesh Karmaker. All rights reserved.
//

#import "MyTextFieldUtils.h"
#import <UIKit/UIKit.h>
@implementation MyTextFieldUtils
+(NSLocale *)getKeyboardLocale{
    NSString *localeID = [[UITextInputMode currentInputMode] primaryLanguage];
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:localeID];
    return locale;
}
+(NSLocale *)getDeviceLocale{
    NSString *localeID = NSLocale.preferredLanguages.firstObject;
    return [NSLocale localeWithLocaleIdentifier:localeID];
}
+(NSNumberFormatter *)getFormatterWithLocale:(NSLocale *)locale{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setLocale:locale];
    return formatter;
}
+(NSString *)getDecimalSeparatorOfLocale:(NSLocale *) locale{
    return [locale objectForKey:NSLocaleDecimalSeparator];
}
+(NSRegularExpression *)createLocalizedRegEx{
    NSNumberFormatter *formatter = [self getFormatterWithLocale:[self getDeviceLocale]];
    NSString *separator = [self getDecimalSeparatorOfLocale:[self getDeviceLocale]];
    NSString *zero = [formatter stringFromNumber:[NSNumber numberWithInt:0]];
    NSString *nine = [formatter stringFromNumber:[NSNumber numberWithInt:9]];
    NSString *exp = [NSString stringWithFormat:@"^[(%@-%@)]{1,4}?(\\%@([%@-%@]{1,2})?)?$",zero,nine,separator,zero,nine];
    return [NSRegularExpression regularExpressionWithPattern:exp options:NSRegularExpressionCaseInsensitive error:nil];
}
+(NSString *)convertToDeviceString:(NSString *)string{
    NSUInteger len = [string length];
    unichar buffer[len+1];
    
    [string getCharacters:buffer range:NSMakeRange(0, len)];
    
    NSLog(@"getCharacters:range: with unichar buffer");
    NSString *result = @"";
    for(int i = 0; i < len; i++) {
        NSString *str = [NSString stringWithFormat: @"%C", buffer[i]];
        if([str isEqualToString:[self getDecimalSeparatorOfLocale:[self getKeyboardLocale]]]){
            result = [result stringByAppendingString:[self getDecimalSeparatorOfLocale:[self getDeviceLocale]]];
        }
        else{
            NSNumberFormatter *formatter1 = [self getFormatterWithLocale:[self getKeyboardLocale]];
            NSNumber *number = [formatter1 numberFromString:string];
            NSNumberFormatter *formatter2 = [self getFormatterWithLocale:[self getDeviceLocale]];
            NSString *numstr = [formatter2 stringFromNumber:number];
            result = [result stringByAppendingString:numstr];
        }
    }
    return result;
}
@end
