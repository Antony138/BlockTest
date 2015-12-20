//
//  ViewController.m
//  BlockTest
//
//  Created by Antony on 15/12/20.
//  Copyright © 2015年 Antony. All rights reserved.
//

#import "ViewController.h"

typedef void (^GlobalBlock)(id, NSUInteger, BOOL *);

@interface ViewController ()

/**
 *  未删除元音字母的的字符串数组
 */
@property (copy, nonatomic) NSArray *oldStrings;

/**
 *  用于保存删除元音字母的字符串数组
 */
@property (copy, nonatomic) NSMutableArray *artifactitiousStrings;

/**
 *  定义(保存)哪些是元音字母
 */
@property (copy, nonatomic) NSArray *vowels;

@property (copy, nonatomic) GlobalBlock aGlobalBlock;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
    [self useBlock];
}

- (void)useBlock {
#pragma mark 声明一个Block变量
    // 注意1:^表明这是一个Block
    // 注意2:Block是一个变量,可以有具体的值。就如“i是一个变量，值为5”一样概念
    // 注意3:因为是变量,所以可以作为方法的参数,进行传递
    // 注意4:void,可以有返回值,返回值写在最前,无返回值写void
    // 注意5:^后面是变量名
    // 注意6:最后的括号内是参数(可以没有参数)
    // 注意7:所以这个变量的「类型」是「一个有三个参数,并且没有返回值的Block对象」(就如变量i的「类型」是「int」一样)
    void (^devowelizer)(id, NSUInteger, BOOL *);
    
#pragma mark 给Block变量赋值
    // 将Block对象赋值给Block变量
    devowelizer = ^(id string, NSUInteger idx, BOOL *stop) {
        NSMutableString *tempString = [NSMutableString stringWithString:string];
        
        for (NSString *s in _vowels) {
            NSRange fullRange = NSMakeRange(0, tempString.length);
            [tempString replaceOccurrencesOfString:s withString:@"" options:NSCaseInsensitiveSearch range:fullRange];
        }
        [_artifactitiousStrings addObject:tempString];
    };
    
    // 将Block对象作为方法的参数
    [_oldStrings enumerateObjectsUsingBlock:devowelizer];
    NSLog(@"处理过后为:%@", _artifactitiousStrings);
    
 #pragma mark 补充1:声明和实现写在一起
    // 也可以将声明和赋值写在一起,例如:
    void (^anOtherDevowelizer)(id, NSUInteger, BOOL *) = ^(id string, NSUInteger idx, BOOL *stop) {
        // Block的赋值内容
    };
    // 使用
    [_oldStrings enumerateObjectsUsingBlock:anOtherDevowelizer];
    
#pragma mark 补充2:利用typedef给Block类型重新起名(定义为一个「新类型」)
    // Block中的内存管理
    __weak typeof(_vowels) weakVowels = _vowels;
    __weak typeof(_artifactitiousStrings) weakArtifactitiousStrings = _artifactitiousStrings;
    
    _aGlobalBlock = ^(id string, NSUInteger idx, BOOL *stop) {
        NSMutableString *tempString = [NSMutableString stringWithString:string];
        
        // Block对象会捕获(拷贝)其使用的外部变量_vowels
        for (NSString *s in weakVowels) {
            NSRange fullRange = NSMakeRange(0, tempString.length);
            [tempString replaceOccurrencesOfString:s withString:@"" options:NSCaseInsensitiveSearch range:fullRange];
        }
        [weakArtifactitiousStrings addObject:tempString];
    };
    // 使用
    [_oldStrings enumerateObjectsUsingBlock:_aGlobalBlock];

#pragma mark 补充3:匿名Block对象
    // 匿名使用Block对象，其实就是省略掉声明、赋值步骤，直接在方法中作为参数穿入
    // 类似NSNumber *num = [NSNumber numberWithInt:5]; 这就是在匿名使用int变量
    // 匿名使用
    [_oldStrings enumerateObjectsUsingBlock:^(NSString  *_Nonnull string, NSUInteger idx, BOOL * _Nonnull stop) {
        NSMutableString *tempString = [NSMutableString stringWithString:string];
        
        for (NSString *s in _vowels) {
            NSRange fullRange = NSMakeRange(0, tempString.length);
            [tempString replaceOccurrencesOfString:s withString:@"" options:NSCaseInsensitiveSearch range:fullRange];
        }
        [_artifactitiousStrings addObject:tempString];
    }];
}

- (void)setupData {
    _oldStrings = @[@"Sauerkraut", @"Raygun", @"Big Nerd Ranch", @"Mississippi"];
    NSLog(@"处理前为:%@", _oldStrings);
    _artifactitiousStrings = [[NSMutableArray alloc] init];
    _vowels = @[@"a", @"e", @"i", @"o", @"u"];
}

@end
