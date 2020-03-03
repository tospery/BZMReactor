//
//  BZMAppDependency.m
//  Pods
//
//  Created by 杨建祥 on 2020/2/22.
//

#import "BZMAppDependency.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import <JLRoutes/JLRoutes.h>
#import <Toast/UIView+Toast.h>
#import "BZMType.h"
#import "BZMConstant.h"
#import "BZMFunction.h"
#import "BZMUser.h"
#import "BZMMisc.h"
#import "BZMParameter.h"
#import "NSDictionary+BZMReactor.h"
#import "UIView+BZMReactor.h"

@interface BZMAppDependency ()
@property (nonatomic, strong, readwrite) BZMProvider *provider;
@property (nonatomic, strong, readwrite) BZMNavigator *navigator;

@end

@implementation BZMAppDependency

#pragma mark - Init
- (instancetype)init {
    if (self = [super init]) {
        self.provider = [[BZMProvider alloc] init];
        self.navigator = [[BZMNavigator alloc] init];
        [self setupFrame];
        [self setupVendor];
        [self setupAppearance];
        [self setupData];
    }
    return self;
}

#pragma mark - View
#pragma mark - Property

#pragma mark - Method
#pragma mark screen
- (void)initialScreen {
}

#pragma mark setup
- (void)setupFrame {
    // Toast
    [CSToastManager setQueueEnabled:YES];
    [CSToastManager setDefaultPosition:CSToastPositionCenter];
    // Route
    @weakify(self)
    [JLRoutes.globalRoutes addRoute:kBZMPatternToast handler:^BOOL(NSDictionary *parameters) {
        BZMVoidBlock_id completion = BZMObjMember(parameters, BZMParameter.block, nil);
        @strongify(self)
        return [self.navigator.topView bzm_toastWithParameters:parameters completion:^(BOOL didTap) {
            if (completion) {
                completion(@(didTap));
            }
        }];
    }];
}

- (void)setupVendor {
    
}

- (void)setupAppearance {
    
}

- (void)setupData {
    
}

#pragma mark finish
- (void)entryDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
}

- (void)leaveDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
}

#pragma mark status
- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self save];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    BZMLogDebug(@"disk = %@", NSHomeDirectory());
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self save];
}

#pragma mark url
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    return [JLRoutes routeURL:url];
}

#pragma mark save
- (void)save {
    Class cls = NSClassFromString(@"User");
    if ([cls isSubclassOfClass:BZMUser.class]) {
        SEL sel = NSSelectorFromString(@"current");
        BZMUser *user = ((id (*)(id, SEL))[cls methodForSelector:sel])(cls, sel);
        [user saveWithKey:nil];
    }
    cls = NSClassFromString(@"Misc");
    if ([cls isSubclassOfClass:BZMMisc.class]) {
        SEL sel = NSSelectorFromString(@"current");
        BZMMisc *misc = ((id (*)(id, SEL))[cls methodForSelector:sel])(cls, sel);
        [misc saveWithKey:nil];
    }
}

#pragma mark - Delegate
#pragma mark - Class
+ (instancetype)sharedInstance {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

@end
