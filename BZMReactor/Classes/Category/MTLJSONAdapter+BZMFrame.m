//
//  MTLJSONAdapter+BZMFrame.m
//  Pods
//
//  Created by 杨建祥 on 2020/2/22.
//

#import "MTLJSONAdapter+BZMFrame.h"
#import "NSValueTransformer+BZMFrame.h"

@implementation MTLJSONAdapter (BZMFrame)
+ (NSValueTransformer *)NSStringJSONTransformer {
    return [NSValueTransformer valueTransformerForName:BZMStringValueTransformerName];
}

+ (NSValueTransformer *)UIColorJSONTransformer {
    return [NSValueTransformer valueTransformerForName:BZMColorValueTransformerName];
}

@end
