//
//  NSObject+AUUCategory.m
//  AUUKits
//
//  Created by 胡金友 on 11/16/15.
//  Copyright © 2015 Joyous Hu. All rights reserved.
//

#import "NSObject+AUUCategory.h"
#import <objc/runtime.h>

void methodExchangeImplementations(Class cls,
                                   SEL originSelector,
                                   SEL swizedSelector)
{
    Method originMethod = class_getInstanceMethod(cls, originSelector);
    Method swizedMethod = class_getInstanceMethod(cls, swizedSelector);
    
    method_exchangeImplementations(swizedMethod, originMethod);
    
    NSLog(@"%@", NSStringFromClass(cls));
}

@implementation NSObject (AUUCategory)

+ (void)methodExchangeImplementationsWithOriginSelector:(SEL)originSelector
                                         swizedSelector:(SEL)swizedSelector
{
    methodExchangeImplementations([self class], originSelector, swizedSelector);
}

+ (NSArray *)catchMyMethods
{
    unsigned int methodPtrLength = 0;
    
    Method *methodPtr = class_copyMethodList([self class], &methodPtrLength);
    
    NSMutableArray *methodsArray = [[NSMutableArray alloc] initWithCapacity:methodPtrLength];
    
    for (unsigned int i = 0; i < methodPtrLength; i ++)
    {
        Method method = methodPtr[i];
        
        SEL sel = method_getName(method);
        
        const char *name = sel_getName(sel);
        
        [methodsArray addObject:[NSString stringWithUTF8String:name]];
    }
    
    return methodsArray;
}

+ (NSArray *)catchMyAttributes
{
    unsigned int ivars = 0;
    
    Ivar *varPtr = class_copyIvarList([self class], &ivars);
    
    NSMutableArray *varArray = [[NSMutableArray alloc] initWithCapacity:ivars];
    
    for (unsigned int i = 0; i < ivars; i ++)
    {
        Ivar curIvar = varPtr[i];
        
        const char *key = ivar_getName(curIvar);
        
        const char *type = ivar_getTypeEncoding(curIvar);
        
        [varArray addObject:[NSString stringWithFormat:@"%@  -  %@",
                             [NSString stringWithCString:key encoding:NSUTF8StringEncoding],
                             [NSString stringWithCString:type encoding:NSUTF8StringEncoding]]];
    }
    
    return varArray;
}

- (void)setAssociatedPropertyWithKey:(const char *)key andValue:(id)value
{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (id)getAssociatedPropertyWithKey:(const char *)key
{
    return objc_getAssociatedObject(self, key);
}

@end
