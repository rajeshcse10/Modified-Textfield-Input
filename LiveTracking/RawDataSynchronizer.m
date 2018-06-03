//
//  RawDataSynchronizer.m
//  LiveTracking
//
//  Created by Rajesh Karmaker on 28/5/18.
//  Copyright © 2018 Rajesh Karmaker. All rights reserved.
//

#import "RawDataSynchronizer.h"

@implementation RawDataSynchronizer
+ (id) sharedInstance {
    static dispatch_once_t onceToken;
    static id rds = nil;
    dispatch_once(&onceToken, ^{
        rds = [[RawDataSynchronizer alloc] init];
    });
    return rds;
}

@end

