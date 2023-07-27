//
//  Swzzling.h
//  NiuNiuRent
//
//  Created by Q Z on 2023/4/27.
//

#ifndef Swzzling_h
#define Swzzling_h

#include <objc/runtime.h>
#import <objc/message.h>
static inline void swizzling_exchangeMethodWithSelector(Class clazz, SEL originalSelector, SEL exchangeSelector) {
    // 获取原方法
    Method originalMethod = class_getInstanceMethod(clazz, originalSelector);
    // 获取需要交换的方法
    Method exchangeMethod = class_getInstanceMethod(clazz, exchangeSelector);
    if (!originalMethod || !exchangeMethod) {
        return;
    }
    
    if (class_addMethod(clazz, originalSelector, method_getImplementation(exchangeMethod), method_getTypeEncoding(exchangeMethod))) {
        class_replaceMethod(clazz, exchangeSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, exchangeMethod);
    }
}

static inline void swizzling_exchangeMethodWithMethod(Method originalMethod, Method exchangeMethod) {
    method_exchangeImplementations(originalMethod, exchangeMethod);
}

static inline void objcMessageSend(id obj, SEL selctor){
    ((void (*)(id, SEL))objc_msgSend)(obj, selctor);
}


#endif /* Swzzling_h */
