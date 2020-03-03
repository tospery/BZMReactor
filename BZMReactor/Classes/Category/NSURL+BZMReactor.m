//
//  NSURL+BZMReactor.m
//  Pods
//
//  Created by 杨建祥 on 2020/2/22.
//

#import "NSURL+BZMReactor.h"
#import "BZMReactorManager.h"
#import "NSString+BZMReactor.h"

@implementation NSURL (BZMReactor)

+ (NSURL *)bzm_urlWithPath:(NSString *)path {
    if (!path || ![path isKindOfClass:NSString.class] || !path.length || [path isEqualToString:@"/"]) {
        return nil;
    }
    NSString *pathString = path;
    if ([pathString hasPrefix:@"/"]) {
        pathString = [pathString substringFromIndex:1];
    }
    NSString *urlString = BZMStrWithFmt(@"%@/%@", BZMReactorManager.sharedInstance.baseURLString, pathString);
    return [NSURL URLWithString:urlString];
}

+ (NSURL *)bzm_urlWithPattern:(NSString *)pattern {
    if (!pattern || ![pattern isKindOfClass:NSString.class] || !pattern.length || [pattern isEqualToString:@"/"]) {
        return nil;
    }
    NSString *pathString = pattern;
    if ([pathString hasPrefix:@"/"]) {
        pathString = [pathString substringFromIndex:1];
    }
    NSString *urlString = BZMStrWithFmt(@"%@://%@", BZMReactorManager.sharedInstance.appScheme, pathString);
    return [NSURL URLWithString:urlString];
}

@end
