//
//  MTLJSONAdapter+BZMReactor.m
//  Pods
//
//  Created by 杨建祥 on 2020/2/22.
//

#import "MTLJSONAdapter+BZMReactor.h"
#import "NSValueTransformer+BZMReactor.h"

@implementation MTLJSONAdapter (BZMReactor)
+ (NSValueTransformer *)NSStringJSONTransformer {
    return [NSValueTransformer valueTransformerForName:BZMStringValueTransformerName];
}

+ (NSValueTransformer *)UIColorJSONTransformer {
    return [NSValueTransformer valueTransformerForName:BZMColorValueTransformerName];
}

@end
