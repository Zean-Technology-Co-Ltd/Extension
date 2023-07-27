//
//  UIDevice+NNExten.m
//  NiuNiuRent
//
//  Created by Q Z on 2023/7/6.
//

#import "UIDevice+NNExten.h"
//计算存储空间
#include <sys/param.h>
#include <sys/mount.h>

//计算内存大小
#import <mach/mach.h>
#import <mach/mach_host.h>

@implementation UIDevice (NNExten)

// 获取总内存大小
+ (NSString *)getTotalMemorySize {
    long long totalMemorySize = [NSProcessInfo processInfo].physicalMemory;
    return [self fileSizeToString:totalMemorySize];
}

// 获取当前可用内存
+ (NSString *)getAvailableMemorySize {
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    if (kernReturn != KERN_SUCCESS) {
        return @"内存查找失败";
    }
    long long availableMemorySize = ((vm_page_size * vmStats.free_count + vm_page_size * vmStats.inactive_count));
    return [self fileSizeToString:availableMemorySize];
}

// 获取总磁盘容量
+ (NSString *)getTotalDiskSize {
    struct statfs buf;
    unsigned long long totalDiskSize = -1;
    if (statfs("/var", &buf) >= 0) {
        totalDiskSize = (unsigned long long)(buf.f_bsize * buf.f_blocks);
    }
    return [self fileSizeToString:totalDiskSize];
}

// 获取可用磁盘容量  f_bavail 已经减去了系统所占用的大小，比 f_bfree 更准确
+ (NSString *)getAvailableDiskSize {
    struct statfs buf;
    unsigned long long availableDiskSize = -1;
    if (statfs("/var", &buf) >= 0) {
        availableDiskSize = (unsigned long long)(buf.f_bsize * buf.f_bavail);
    }
    return [self fileSizeToString:availableDiskSize];
}

+ (NSString *)fileSizeToString:(unsigned long long)fileSize {
    NSInteger KB = 1024;
    NSInteger MB = KB*KB;
    NSInteger GB = MB*KB;

    if (fileSize < 10)  {
        return @"0 B";
    }else if (fileSize < KB) {
        return @"< 1 KB";
    }else if (fileSize < MB) {
        return [NSString stringWithFormat:@"%.2f KB",((CGFloat)fileSize)/KB];
    }else if (fileSize < GB) {
        return [NSString stringWithFormat:@"%.2f MB",((CGFloat)fileSize)/MB];
    }else {
         return [NSString stringWithFormat:@"%.2f GB",((CGFloat)fileSize)/GB];
    }
}

@end
