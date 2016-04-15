//
//  SXNSObjectAdditions.m
//  TPO
//
//  Created by SunX on 14-5-14.
//  Copyright (c) 2014年 SunX. All rights reserved.
//

#import "NSObject+AJAddition.h"
#import <objc/runtime.h>

@implementation NSObject (AJAddition)

+(void)load{
}

- (void)safeSetProperty:(NSDictionary *)item{
    if (!item || ![item isKindOfClass:[NSDictionary class]]) {
        return;
    }
    
    //设置类的property
    [self _setClass:[self class] withPropertyDic:item];
    
    //设置父类的property
    if (self.superclass) {
        [self _setClass:self.superclass withPropertyDic:item];
    }
}

-(void)_setClass:(Class)class withPropertyDic:(NSDictionary*)item{
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(class, &outCount);
    for (i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        //property名称
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        id valueItem = item[propertyName];
        if (valueItem) {
            //获取该property的数据类型
            const char* attries = property_getAttributes(property);
            NSString *attrString = [NSString stringWithUTF8String:attries];
            [self _safeSetPropertyType:attrString value:valueItem withName:propertyName];
        }
    }
    if(properties) free(properties);
}

-(void)_safeSetPropertyType:(NSString*)attriString
               value:(id)value
        withName:(NSString*)propertyName{
    //kvc不支持c的数据类型，所以只能NSNumber转化，NSNumber可以  64位是TB
    if ([attriString hasPrefix:@"T@\"NSString\""]) {
        [self setValue:safeString(value) forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"Tc"] || [attriString hasPrefix:@"TB"]) {
        //32位Tc  64位TB
        [self setValue:[NSNumber numberWithBool:[value boolValue]] forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"Ti"] || [attriString hasPrefix:@"Tq"]) {
        //32位 Ti是int 和 NSInteger  64位后，long 和  NSInteger 都是Tq， int 是Ti
        [self setValue:[NSNumber numberWithInteger:[safeString(value) integerValue]] forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"TQ"] || [attriString hasPrefix:@"TI"]) {
        [self setValue:[NSNumber numberWithInteger:[[[NSNumberFormatter new] numberFromString:safeString(value)] unsignedIntegerValue]] forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"Tl"]) { //32位 long
        [self setValue:[NSNumber numberWithLongLong:[safeString(value) longLongValue]] forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"Tf"]) { //float
        [self setValue:[NSNumber numberWithFloat:[safeString(value) floatValue]] forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"Td"]) { //CGFloat
        [self setValue:[NSNumber numberWithDouble:[safeString(value) doubleValue]] forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"T@\"NSMutableArray\""]) {
        [self setValue:safeMutableArray(value) forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"T@\"NSArray\""]) {
        [self setValue:safeArray(value) forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"T@\"NSDictionary\""]) {
        [self setValue:safeDictionary(value) forKey:propertyName];
    }
    else if ([attriString hasPrefix:@"T@\"NSMutableDictionary\""]) {
        [self setValue:safeMutableDictionary(value) forKey:propertyName];
    }else{
        NSString *className = [self parseClassNameFromAttrString:attriString];
        if ([value isKindOfClass:NSClassFromString(className)]) {
            [self setValue:value forKey:propertyName]; //以上类型以外，默认设置上，需确保类型匹配，如类型不匹配，则可能会崩溃！！
        }
    }
}

-(void)resetAllProperty {
    //获取所有property
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        //property名称
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        //获取该property的数据类型
        const char* attries = property_getAttributes(property);
        NSString *attrString = [NSString stringWithUTF8String:attries];
        if ([attrString hasPrefix:@"T@"]) {
            [self setValue:nil forKey:propertyName];
        }
    }
    if(properties) free(properties);
}

-(NSDictionary*)getAllProperties {
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        //property名称
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        if ([self valueForKey:propertyName]) {
            [props setObject:[self valueForKey:propertyName] forKey:propertyName];
        }
    }
    if(properties) free(properties);
    return props;
}

-(NSString*)findClassNameOfProperty:(NSString*)propertyName{
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i<outCount; i++){
        objc_property_t property = properties[i];
        const char* char_f = property_getName(property);
        //property名称
        NSString *name = [NSString stringWithUTF8String:char_f];
        if ([name isEqualToString:propertyName]) {
            //获取该property的数据类型
            const char* attries = property_getAttributes(property);
            NSString *attrString = [NSString stringWithUTF8String:attries];
            if ([attrString hasPrefix:@"T@"]) {
                return [self parseClassNameFromAttrString:attrString];
            }
        }
    }
    return nil;
}

-(NSString*)parseClassNameFromAttrString:(NSString*)attrString{
    NSRange startRange = [attrString rangeOfString:@"T@\""];
    NSRange endRange = [attrString rangeOfString:@"\","];
    NSRange nameRange = NSMakeRange(startRange.length, endRange.location-startRange.length);
    NSString *className = [attrString substringWithRange:nameRange];
    return className;
}

#pragma mark - safeObjectFortKey & safeObjectAtIndex
- (id)safeObjectFortKey:(NSString *)key {
    if ([self isKindOfClass:[NSDictionary class]] || [self isKindOfClass:[NSMutableDictionary class]]) {
        return [(NSDictionary*)self objectForKey:key];
    }
    return nil;
}

- (id)safeObjectAtIndex:(NSUInteger)index {
    if ([self isKindOfClass:[NSArray class]] || [self isKindOfClass:[NSMutableArray class]]) {
        if (index < [(NSArray*)self count]) {
            return [(NSArray*)self objectAtIndex:index];
        }
        return nil;
    }
    return nil;
}

#pragma mark - jsonEncode & jsonDecode
- (NSString*)jsonEncode {
    if ([self isKindOfClass:[NSArray class]] ||
        [self isKindOfClass:[NSMutableArray class]] ||
        [self isKindOfClass:[NSDictionary class]] ||
        [self isKindOfClass:[NSMutableDictionary class]]) {
        NSError *error = nil;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&error];
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return nil;
}

- (id)jsonDecode {
    if(![self isKindOfClass:[NSString class]]) return nil;
    NSData *data =  [(NSString*)self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error=nil;
    return [NSJSONSerialization JSONObjectWithData:data
                                           options:NSJSONReadingMutableContainers error:&error];
}

#pragma mark - extra data
-(void)setExtraData:(id)extraData{
    objc_setAssociatedObject(self, @selector(extraData),
                             extraData,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(id)extraData{
    return objc_getAssociatedObject(self, _cmd);
}

// 要求：替换的方法一律命名：swizz_原方法名
// 优先查询类方法，再查询对象方法
+(void)swizzMethod:(NSString*)methodName{
    NSString *swizzName = [NSString stringWithFormat:@"swizz_%@", methodName];
    [self swizzMethod:methodName toMethod:swizzName];
}

+(void)swizzMethod:(NSString *)methodName toMethod:(NSString*)swizzName{
    Class class = object_getClass((id)self); // 类方法的swizzle需如此获取class
    Method originMethod = class_getInstanceMethod(class, NSSelectorFromString(methodName));
    Method swizzleMethod = class_getInstanceMethod(class, NSSelectorFromString(swizzName));
    
    if (!originMethod || !swizzleMethod) {
        originMethod = class_getInstanceMethod([self class], NSSelectorFromString(methodName));
        swizzleMethod = class_getInstanceMethod([self class], NSSelectorFromString(swizzName));
    }
    
    NSAssert(originMethod && swizzleMethod, @"swizz method not found"); // 用来检测方法是否都存在
    method_exchangeImplementations(originMethod, swizzleMethod);
}

@end

//------------------------------------------------------------------------------
/**
 *  数据校验
 */
NSString* safeString(id obj) {
    return [obj isKindOfClass:[NSObject class]]?[NSString stringWithFormat:@"%@",obj]:@"";
}

NSArray* safeArray(id obj)  {
    return [obj isKindOfClass:[NSArray class]]?obj:nil;
}

NSDictionary* safeDictionary(id obj) {
    return [obj isKindOfClass:[NSDictionary class]]?obj:nil;
}

NSMutableArray* safeMutableArray(id obj)   {
    return [obj isKindOfClass:[NSArray class]] || [obj isKindOfClass:[NSMutableArray class]] ? [NSMutableArray arrayWithArray:obj] :nil;
}

NSMutableDictionary* safeMutableDictionary(id obj)  {
    return [obj isKindOfClass:[NSDictionary class]] || [obj isKindOfClass:[NSMutableDictionary class]] ? [NSMutableDictionary dictionaryWithDictionary:obj] : nil;
}



