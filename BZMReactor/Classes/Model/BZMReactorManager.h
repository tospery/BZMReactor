//
//  BZMReactorManager.h
//  BZMReactor
//
//  Created by 杨建祥 on 2020/2/28.
//

#import <UIKit/UIKit.h>
#import "BZMPage.h"

@interface BZMReactorManager : NSObject
@property (nonatomic, assign) CGFloat autoLogin;
@property (nonatomic, assign) CGFloat fontScale;
@property (nonatomic, strong) NSString *loginPattern;
@property (nonatomic, strong) NSString *baseURLString;
@property (nonatomic, strong) NSString *appScheme;
@property (nonatomic, strong) BZMPage *page;


+ (instancetype)sharedInstance;

@end
