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

@property (strong, nonatomic) CBCentralManager *bleManager;

@end

@implementation AWCentralManagerOC
// 如何开始扫描？

- (instancetype)init
{
    self = [super init];
    if (self) {
        _bleManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    }
    return self;
}


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

#pragma mark - CBPeripheralDelegate (9个方法,都是可选的方法)
#pragma mark 方法1:蓝牙设备名称更新会调用这个方法?(IUL11改名会调用这个方法，拿到新的名称吗?确认。)
- (void)peripheralDidUpdateName:(CBPeripheral *)peripheral {
    
}

#pragma mark 方法2:修改“服务”后会调用的方法(谁修改“服务”?)
- (void)peripheral:(CBPeripheral *)peripheral didModifyServices:(NSArray<CBService *> *)invalidatedServices {

}

#pragma mark 方法3:读取到RSSI后会调用的方法
- (void)peripheral:(CBPeripheral *)peripheral didReadRSSI:(NSNumber *)RSSI error:(NSError *)error {

}

#pragma mark 方法4:发现“服务”后会调用的方法
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error {

}

#pragma mark 方法5:发现“服务”里面的“服务”后会调用的方法
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverIncludedServicesForService:(CBService *)service error:(NSError *)error {

}

#pragma mark 方法6:发现“服务”里面的“特征”后会调用的方法
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error {

}

#pragma mark 方法7:读取到“特征”里面的值后会调用的方法
- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {

}

#pragma mark 方法8:写入数据到“特征”后会调用的方法
- (void)peripheral:(CBPeripheral *)peripheral didWriteValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {

}

#pragma mark 方法9:读取到“特征“通知的值(硬件返回的数据)时会调用的方法
- (void)peripheral:(CBPeripheral *)peripheral didUpdateNotificationStateForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {

}

#pragma mark 方法10:发现“特征“里面的“描述”时会调用的方法
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverDescriptorsForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {

}

#pragma mark 方法11:读取到“描述”的值时会调用的方法
- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForDescriptor:(CBDescriptor *)descriptor error:(NSError *)error {

}

#pragma mark 方法12:写入数据到“描述”时会调用的方法
- (void)peripheral:(CBPeripheral *)peripheral didWriteValueForDescriptor:(CBDescriptor *)descriptor error:(NSError *)error {

}
@end
