//
//  UIDevice+NNExten.h
//  NiuNiuRent
//
//  Created by Q Z on 2023/7/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (NNExten)
/// 获取总内存大小
+ (NSString *)getTotalMemorySize;
/// 获取当前可用内存
+ (NSString *)getAvailableMemorySize;
/// 获取总磁盘容量
+ (NSString *)getTotalDiskSize;
/// 获取可用磁盘容量  f_bavail 已经减去了系统所占用的大小，比 f_bfree 更准确
+ (NSString *)getAvailableDiskSize;

@end

NS_ASSUME_NONNULL_END
