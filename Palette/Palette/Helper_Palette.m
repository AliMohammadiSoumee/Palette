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

+ (int)getRandomNumberBetween:(int)from to:(int)to {
    return (int)from + arc4random() % (to-from+1);
}

+ (NSMutableAttributedString *)MakeJustified_Text:(NSString *)text Font:(UIFont *)font{
//    text = [text stringByReplacingOccurrencesOfString:@"\n" withString:@"faljfioewjfowifjowijfoweijoi"];
    
//    NSArray *vals = [text componentsSeparatedByString:@"\n"];
    
//    text = [text stringByReplacingOccurrencesOfString:@"\n" withString:@""];
//    text = [text stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setBaseWritingDirection:NSWritingDirectionRightToLeft];
    [paragraphStyle setAlignment:NSTextAlignmentJustified];
    [paragraphStyle setLineSpacing:7];
    [paragraphStyle setFirstLineHeadIndent:10];
    
    NSMutableAttributedString* attrStr = [[NSMutableAttributedString alloc] initWithString: text];
    [attrStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attrStr.length)];
    
    NSRange range = (NSRange){0,[attrStr length]};
    
    [attrStr enumerateAttribute:NSFontAttributeName inRange:range options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(id value, NSRange range, BOOL *stop) {
        UIFont *replacementFont = font;
        [attrStr addAttribute:NSFontAttributeName value:replacementFont range:range];
    }];
    
    return attrStr;
}


@end
