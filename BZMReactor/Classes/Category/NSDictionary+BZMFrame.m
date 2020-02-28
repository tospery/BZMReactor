//
//  NSDictionary+BZMFrame.m
//  Pods
//
//  Created by 杨建祥 on 2020/2/22.
//

#import "NSDictionary+BZMFrame.h"
#import "NSObject+BZMFrame.h"
#import "NSString+BZMFrame.h"

@implementation NSDictionary (BZMFrame)

- (NSString *)bzm_stringForKey:(id)key {
    return [self bzm_stringForKey:key withDefault:nil];
}

- (NSString *)bzm_stringForKey:(id)key withDefault:(NSString *)dft {
    if (!key) {
        return dft;
    }
    
    id string = [self objectForKey:key];
    if (!string || ![string isKindOfClass:[NSString class]]) {
        if ([string isKindOfClass:[NSNumber class]]) {
            NSNumber *number = (NSNumber *)string;
            if (number) {
                return number.stringValue;
            }
        }
        return dft;
    }
    
    return string;
}

- (NSNumber *)bzm_numberForKey:(id)key {
    return [self bzm_numberForKey:key withDefault:nil];
}

- (NSNumber *)bzm_numberForKey:(id)key withDefault:(NSNumber *)dft {
    if (!key) {
        return dft;
    }
    
    id number = [self objectForKey:key];
    if (!number || ![number isKindOfClass:[NSNumber class]]) {
        if ([number isKindOfClass:[NSString class]]) {
            NSString *string = (NSString *)number;
            if (string) {
                return @(string.integerValue);
            }
        }
        return dft;
    }
    
    return number;
}

- (NSArray *)bzm_arrayForKey:(id)key {
    return [self bzm_arrayForKey:key withDefault:nil];
}

- (NSArray *)bzm_arrayForKey:(id)key withDefault:(NSArray *)dft {
    if (!key) {
        return dft;
    }
    
    id array = [self objectForKey:key];
    if (!array || ![array isKindOfClass:[NSArray class]]) {
        return dft;
    }
    
    return array;
}

- (NSDictionary *)bzm_dictionaryForKey:(id)key {
    return [self bzm_dictionaryForKey:key withDefault:nil];
}

- (NSDictionary *)bzm_dictionaryForKey:(id)key withDefault:(NSDictionary *)dft {
    if (!key) {
        return dft;
    }
    
    id dictionary = [self objectForKey:key];
    if (!dictionary || ![dictionary isKindOfClass:[NSDictionary class]]) {
        return dft;
    }
    
    return dictionary;
}

- (id)bzm_objectForKey:(id)key {
    return [self bzm_objectForKey:key withDefault:nil];
}

- (id)bzm_objectForKey:(id)key withDefault:(id)dft {
    if (!key) {
        return dft;
    }
    
    id object = [self objectForKey:key];
    if (!object) {
        return dft;
    }
    
    return object;
}

- (NSDictionary *)bzm_dictionaryByUnderlineValuesFromCamel {
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:self.count];
    for (NSString *key in self.allKeys) {
        NSString *value = [self objectForKey:key];
        if (![value isKindOfClass:NSString.class]) {
            [result setObject:value forKey:key];
            continue;
        }
        value = value.bzm_underlineFromCamel;
        [result setObject:value forKey:key];
    }
    return result;
}

+ (NSDictionary *)bzm_dictionaryFromID:(id)data {
    if (!data || ![data isKindOfClass:NSObject.class]) {
        return nil;
    }
    NSObject *obj = (NSObject *)data;
    return obj.bzm_JSONObject;
}

@end
