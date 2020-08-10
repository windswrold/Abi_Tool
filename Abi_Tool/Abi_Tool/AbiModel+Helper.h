//
//  AbiModel+Helper.h
//  Abi_Tool
//
//  Created by Wind on 8/10/20.
//  Copyright © 2020 Wind. All rights reserved.
//

#import "AbiModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AbiModel (Helper)

/**  将十六进制的字符串转换成string */
+ (NSString *)convertHexStrToString:(NSString *)str  ;

+ (unsigned char *) hexToBytes:(NSString*)str  ;

+  (NSString *)getHexByNumber:(NSString *)value ;

+ (NSMutableData *)convertHexStrToData:(NSString *)str ;


+ (NSString *)convertDataToHexStr:(NSData *)data ;



@end

NS_ASSUME_NONNULL_END
