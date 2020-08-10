//
//  AbiModel+Helper.m
//  Abi_Tool
//
//  Created by Wind on 8/10/20.
//  Copyright © 2020 Wind. All rights reserved.
//

#import "AbiModel+Helper.h"
#import "BigNumber.h"


@implementation AbiModel (Helper)

+ (NSString *)convertHexStrToString:(NSString *)str {
   
    if (!str || [str length] == 0) {
        
        return nil;
    }
    str = [str stringByReplacingOccurrencesOfString:@"0x" withString:@""];
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([str length] % 2 == 0) {
        
        range = NSMakeRange(0, 2);
    } else {
        
        range = NSMakeRange(0, 1);
    }
    for (NSInteger i = range.location; i < [str length]; i += 2) {
        
        unsigned int anInt;
        NSString *hexCharStr = [str substringWithRange:range];
        NSScanner * ascanner = [[NSScanner alloc] initWithString:hexCharStr];
        [ascanner scanHexInt:&anInt];
        NSData * aentity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:aentity];
        range.location += range.length;
        range.length = 2;
    }
    NSString * astring = [[NSString alloc]initWithData:hexData encoding:NSUTF8StringEncoding];
    return astring;
    
}

+ (NSMutableData *)convertHexStrToData:(NSString *)str {
   
    if (!str || [str length] == 0) {
        return nil;
    }
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([str length] %2 == 0) {
        range = NSMakeRange(0,2);
    } else {
        range = NSMakeRange(0,1);
    }
    for (NSInteger i = range.location; i < str.length; i += 2) {
      
        unsigned int anInt;
        NSString *hexCharStr = [str substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        range.location += range.length;
        range.length = 2;
    }
    
    return hexData;
}


+ (unsigned char *) hexToBytes:(NSString*)string {

    unsigned char * unsignValues = ( unsigned char *)malloc((int)[string length] / 2 + 1);
    bzero(unsignValues, [string length] / 2 + 1);
    if (string.length  == 0 ) {
        
        return unsignValues;
    }
    for (int i = 0; i < [string length] - 1; i += 2) {
        
        unsigned int anInt;
        NSString * hexCharStr = [string substringWithRange:NSMakeRange(i, 2)];
        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        unsignValues[i / 2] = (char)anInt;
    }
    return unsignValues ;
}

+  (NSString *)getHexByNumber:(NSString *)value {
    
    BigNumber * tempStr = [BigNumber bigNumberWithDecimalString:value];

    //10进制转换16进制（支持无穷大数）
//    tempStr = [BigNumber bigNumberWithDecimalString:@"1208925819614629174706175"]; ;
    //10进制转换16进制（支持无穷大数）
    //    tempStr = [BigNumber bigNumberWithDecimalString:@"1208925819614629174706175"]; ;
        BigNumber * cacheString = tempStr ;
        BigNumber * tempValue = [BigNumber bigNumberWithInteger:16] ;
        NSString * nLetterValue;
        NSString * str = @"";
        BigNumber * tempData = [BigNumber bigNumberWithInteger:0];
       
        for (int i = 0; i < cacheString.decimalString.length; i++) {
            
            tempData = [tempStr mod:tempValue];
            tempStr = [tempStr div:tempValue];
            switch (tempData.integerValue) {
                case 10:
                    nLetterValue = @"A";
                    break;
                case 11:
                    nLetterValue = @"B";
                    break;
                case 12:
                    nLetterValue = @"C";
                    break;
                case 13:
                    nLetterValue = @"D";
                    break;
                case 14:
                    nLetterValue = @"E";
                    break;
                case 15:
                    nLetterValue = @"F";
                    break;
                default:
                    nLetterValue = tempData.decimalString ;
            }
            str = [nLetterValue stringByAppendingString:str];
            if ([tempStr isEqualTo:[BigNumber bigNumberWithInteger: 0]]) {
                
                break;
            }
        }
        return str;
}

+ (NSString *)convertDataToHexStr:(NSData *)data {
    if (!data || [data length] == 0) {
        return @"";
    }
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:[data length]];
    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if ([hexStr length] == 2) {
                [string appendFormat:@"%@", hexStr];
            } else {
                [string appendFormat:@"0%@", hexStr];
            }
        }
    }];
    
    return string;
}

@end
