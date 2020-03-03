//
//  UICollectionReusableView+BZMReactor.m
//  Pods
//
//  Created by 杨建祥 on 2020/2/24.
//

#import "UICollectionReusableView+BZMReactor.h"
#import "NSString+BZMReactor.h"

@implementation UICollectionReusableView (BZMReactor)
+ (NSString *)bzm_reuseId {
    return BZMStrWithFmt(@"%@Identifier", NSStringFromClass(self));
}

@end
