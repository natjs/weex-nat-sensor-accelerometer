//
//  WeexNatSensorAccelerometer.m
//
//  Created by huangyake on 17/1/7.
//  Copyright © 2017 Instapp. All rights reserved.
//

#import "WeexNatSensorAccelerometer.h"
#import <WeexPluginLoader/WeexPluginLoader.h>
#import <NatAccelerometer/NatAccelerometer.h>

@implementation WeexNatSensorAccelerometer

WX_PlUGIN_EXPORT_MODULE(nat/sensor/accelerometer, WeexNatSensorAccelerometer)
WX_EXPORT_METHOD(@selector(get:))
WX_EXPORT_METHOD(@selector(watch::))
WX_EXPORT_METHOD(@selector(clearWatch:))

- (void)get:(WXModuleCallback)callback{
    [[NatAccelerometer singletonManger] get:^(id error,id result) {
        if (callback) {
            if (error) {
                callback(error);
            } else {
                callback(result);
            }
        }
    }];
}

- (void)watch:(NSDictionary *)options :(WXModuleKeepAliveCallback)callback{
    [[NatAccelerometer singletonManger] watch:options :^(id error,id result) {
        if (callback) {
            if (error) {
                callback(error, YES);
            } else {
                callback(result, YES);
            }
        }
    }];
}

- (void)clearWatch:(WXModuleCallback)callback{
    [[NatAccelerometer singletonManger] clearWatch:^(id error,id result) {
        if (callback) {
            if (error) {
                callback(error);
            } else {
                callback(result);
            }
        }
    }];
}

- (void)dealloc{
    [[NatAccelerometer singletonManger] close];
}

@end
