//
//  MyTopAlert.h
//  mactehrannew
//
//  Created by hAmidReza on 6/5/17.
//  Copyright © 2017 archibits. All rights reserved.
//

#import "_viewBase.h"
#import "MyShapeButton.h"

typedef enum : NSUInteger {
	MyTopAlertTypeError,
	MyTopAlertTypeSuccess,
	MyTopAlertTypeInfo,
	MyTopAlertTypeWarning,
} MyTopAlertType;

@interface MyTopAlert : _viewBase

/**
 sets the title's font
 default Nan
 */
@property (retain, nonatomic) UIFont* titleFont UI_APPEARANCE_SELECTOR;

/**
 sets the caption's font
 default Nan
 */
@property (retain, nonatomic) UIFont* captionFont UI_APPEARANCE_SELECTOR;

/**
 default 30
 */
@property (assign, nonatomic) CGFloat iconTop UI_APPEARANCE_SELECTOR;

@property (retain, nonatomic) MyShapeButton* icon;
@property (retain, nonatomic) UILabel* titleLabel;
@property (retain, nonatomic) UILabel* messageLabel;

+(void)presentAlertType:(MyTopAlertType)type title:(NSString*)title message:(NSString*)message onViewController:(UIViewController*)vc alignWithTopOfView:(UIView*)alignTopWithView;
+(void)presentAlertType:(MyTopAlertType)type title:(NSString*)title message:(NSString*)message onViewController:(UIViewController*)vc alignWithTopOfView:(UIView*)alignTopWithView actionView:(UIView *)actionView;
+(void)presentAlertType:(MyTopAlertType)type title:(NSString*)title message:(NSString*)message onViewController:(UIViewController*)vc;
+(void)presentAlertType:(MyTopAlertType)type title:(NSString*)title message:(NSString*)message onViewController:(UIViewController*)vc actionView:(UIView*)actionView;
+(void)presentAlertType:(MyTopAlertType)type title:(NSString*)title message:(NSString*)message onViewController:(UIViewController*)vc optionsBlock:(void (^)(MyTopAlert* topAlert))topAlertBlock;
+(void)hideTopAlertForVC:(UIViewController*)vc animated:(BOOL)animated;
@end
