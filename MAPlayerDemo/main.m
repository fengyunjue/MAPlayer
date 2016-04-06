//
//  main.m
//  MAPlayer
//
//  Created by admin on 15/6/19.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "MAApplication.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
//添加MAApplication
        return UIApplicationMain(argc, argv, NSStringFromClass([MAApplication class]), NSStringFromClass([AppDelegate class]));
    }
}
