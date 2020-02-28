//
//  BZMBaseModel.h
//  Pods
//
//  Created by 杨建祥 on 2020/2/22.
//

#import <UIKit/UIKit.h>
#import <Mantle/Mantle.h>
#import "BZMIdentifiable.h"

@interface BZMBaseModel : MTLModel <MTLJSONSerializing, BZMIdentifiable>

- (void)save;
- (void)saveWithKey:(NSString *)key;

+ (void)storeObject:(BZMBaseModel *)object;
+ (void)storeObject:(BZMBaseModel *)object withKey:(NSString *)key;
+ (void)storeArray:(NSArray *)array;

+ (void)eraseObject:(BZMBaseModel *)object;
+ (void)eraseObjectForKey:(NSString *)key;
+ (void)eraseArray;

+ (instancetype)cachedObject;
+ (instancetype)cachedObjectWithKey:(NSString *)key;
+ (NSArray *)cachedArray;

+ (instancetype)current;

@end

