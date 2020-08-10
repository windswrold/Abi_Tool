//
//  AbiModel.h
//  Abi_Tool
//
//  Created by Wind on 8/10/20.
//  Copyright © 2020 Wind. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AbiModel : NSObject

@property (nonatomic, assign ) BOOL numberType ; //是否为基本数字类型：int、float等
@property (nonatomic, assign ) BOOL addrType ; //是否为地址
@property (nonatomic, assign ) BOOL bytesData ; //是否为byte
@property (nonatomic, copy )   NSString * value ;   //数据内容

+(NSData * )abiDataWithAbiModel:( NSArray <AbiModel * >* ) abis ;


@end

NS_ASSUME_NONNULL_END
