//
//  UIFont+BZMReactor.m
//  Pods
//
//  Created by 杨建祥 on 2020/2/23.
//

#import "UIFont+BZMReactor.h"
#import <QMUIKit/QMUIKit.h>
#import "BZMReactorManager.h"

@implementation UIFont (BZMReactor)

+ (UIFont *)bzm_fontWithNormal:(CGFloat)size {
    return [UIFont systemFontOfSize:(size + BZMReactorManager.sharedInstance.fontScale)];
}

+ (UIFont *)bzm_fontWithBold:(CGFloat)size {
    return [UIFont boldSystemFontOfSize:(size + BZMReactorManager.sharedInstance.fontScale)];
}

+ (UIFont *)bzm_fontWithLight:(CGFloat)size {
    return [UIFont qmui_lightSystemFontOfSize:(size + BZMReactorManager.sharedInstance.fontScale)];
}

@end
