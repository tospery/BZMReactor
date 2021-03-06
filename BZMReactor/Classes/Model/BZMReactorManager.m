//
//  BZMReactorManager.m
//  BZMReactor
//
//  Created by 杨建祥 on 2020/2/28.
//

#import "BZMReactorManager.h"
#import <QMUIKit/QMUIKit.h>
#import "NSString+BZMReactor.h"
#import "UIApplication+BZMReactor.h"

@interface BZMReactorManager ()

@end

@implementation BZMReactorManager
- (instancetype)init {
    if (self = [super init]) {
        self.autoLogin = YES;
        self.loginPattern = @"login";
        self.appScheme = UIApplication.sharedApplication.bzm_urlScheme;
        self.baseURLString = BZMStrWithFmt(@"https://m.%@.com", self.appScheme);
        self.fontScale = IS_320WIDTH_SCREEN ? -2 : 0;
        self.page = [[BZMPage alloc] init];
    }
    return self;
}

+ (instancetype)sharedInstance {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self.class alloc] init];
    });
    return instance;
}

@end
