//
//  Helper_Palette.m
//  Palette
//
//  Created by Ali Soume`e on 6/1/1396 AP.
//  Copyright © 1396 Ali Soume`e. All rights reserved.
//

#import "Helper_Palette.h"

@implementation Helper_Palette


+ (NSString*)convertEnNumberToFarsi:(NSString*)number {
    number = _strfmt(@"1%@", number);
    NSString *text;
    NSDecimalNumber *someNumber = [NSDecimalNumber decimalNumberWithString:number];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSLocale *gbLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"fa"];
    [formatter setLocale:gbLocale];
    text = [formatter stringFromNumber:someNumber];
    text = [text substringWithRange:NSMakeRange(1, text.length - 1)];
    return text;
}


@end
