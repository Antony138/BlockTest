//
//  AWCentralManagerOC.m
//  BlockTest
//
//  Created by Antony on 15/12/21.
//  Copyright © 2015年 Antony. All rights reserved.
//

#import "AWCentralManagerOC.h"
@import CoreBluetooth;

@interface AWCentralManagerOC ()<CBCentralManagerDelegate, CBPeripheralDelegate>

@end

@implementation AWCentralManagerOC
// 如何开始扫描？

#pragma mark - CBCentralManagerDelegate (6个方法,1个必须实现)
#pragma mark 方法1:手机蓝牙状态的更新时调用的方法(6种状态)
- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    switch (central.state) {
        case CBCentralManagerStateUnknown: {
            NSLog(@"CBCentralManagerStateUnknown");
            break;
        }
        case CBCentralManagerStateResetting: {
            NSLog(@"CBCentralManagerStateResetting");
            break;
        }
        case CBCentralManagerStateUnsupported: {
            NSLog(@"CBCentralManagerStateUnsupported");
            break;
        }
        case CBCentralManagerStateUnauthorized: {
            NSLog(@"CBCentralManagerStateUnauthorized");
            break;
        }
        case CBCentralManagerStatePoweredOff: {
            NSLog(@"CBCentralManagerStatePoweredOff");
            break;
        }
        case CBCentralManagerStatePoweredOn: {
            NSLog(@"CBCentralManagerStatePoweredOn");
            break;
        }
    }
}

#pragma mark 方法2:状态重设调用的方法?(好像没用到过)
- (void)centralManager:(CBCentralManager *)central
      willRestoreState:(NSDictionary<NSString *,id> *)dict {

}

#pragma mark 方法3:发现蓝牙(外围)设备时调用的方法
- (void)centralManager:(CBCentralManager *)central
 didDiscoverPeripheral:(CBPeripheral *)peripheral
     advertisementData:(NSDictionary<NSString *,id> *)advertisementData
                  RSSI:(NSNumber *)RSSI {
    NSLog(@"发现蓝牙设备");
}

#pragma mark 方法4:成功连接一个蓝牙设备时调用的方法
- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral{
    NSLog(@"成功连接一个设备");
}

#pragma mark 方法5:没有成功连接蓝牙设备时调用的方法？
- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {

}

#pragma mark 方法6:蓝牙设备断开连接时调用的方法
- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    NSLog(@"");
}
@end
