//
//  AbiModel.m
//  Abi_Tool
//
//  Created by Wind on 8/10/20.
//  Copyright © 2020 Wind. All rights reserved.
//

#import "AbiModel.h"
#import "AbiModel+Helper.h"

@implementation AbiModel


/**  构造基于abi 的数据 */
+(NSData * )abiDataWithAbiModel:( NSArray <AbiModel * >* ) abis {
    
    NSMutableData * allData= [NSMutableData data];
    NSMutableArray * dataArr = [NSMutableArray array];
    NSMutableArray * multiData = [NSMutableArray array];
    NSInteger multiLen = 0 ;
    for (int a = 0 ; a < abis.count ; a ++ ) {
     
        AbiModel * model = abis[a] ;
        if (model.numberType) {
           
            NSString * numValue = model.value ;
            NSString * hexNum = [AbiModel getHexByNumber:numValue];
            NSData * hexData = [AbiModel convertHexStrToData:hexNum] ;
            NSMutableData * muTab = [NSMutableData data];
            [muTab increaseLengthBy:32 - hexData.length ] ;
            [muTab appendData:hexData];
            [dataArr addObject:muTab];
            
        }
        else if (model.addrType){
            
            NSString * addv = model.value ;
            NSData * addData = [NSData dataWithBytes:[AbiModel hexToBytes:addv] length:addv.length /2 ];
            NSMutableData * muTab = [NSMutableData data];
            [muTab increaseLengthBy:32 - addData.length ] ;
            [muTab appendData:addData];
            [dataArr addObject:muTab];
            
        }
        else if (model.bytesData){
            
            NSString * byte = model.value ;
            NSData * valueData = [NSData dataWithBytes:[AbiModel hexToBytes:byte] length:byte.length /2 ];
            
            NSMutableData * muTab = [NSMutableData data];
            NSMutableData * startData = [NSMutableData data];
            NSInteger offset =  abis.count * 32 + multiLen  ;
            NSString * startLen = [AbiModel getHexByNumber:[NSString stringWithFormat:@"%ld",offset]];
            NSData * startD = [AbiModel convertHexStrToData:startLen] ;
            [startData increaseLengthBy: 32 - startD.length ] ;
            [startData appendData:startD] ;
            [dataArr addObject:startData];
            
            NSString * hexLen = [AbiModel getHexByNumber:[NSString stringWithFormat:@"%ld",valueData.length]];
            NSData * lenData = [AbiModel convertHexStrToData:hexLen] ;
            [muTab increaseLengthBy:32 - lenData.length ] ;
            [muTab appendData:lenData] ;
            [muTab appendData:valueData] ;
            NSInteger len = 0 ;
            if (valueData.length > 0 ) {
                len = (valueData.length / 32 ) * 32  + (valueData.length % 32) > 0 ? 32 : 0 ;
                [muTab increaseLengthBy:len - valueData.length ];
            }
            [multiData addObject:muTab];
            multiLen += muTab.length  ;
        }
        else {
            
            //
            NSMutableData * muTab = [NSMutableData data];
            NSMutableData * startData = [NSMutableData data];
            NSInteger offset =  abis.count * 32 + multiLen  ;
            NSString * startLen = [AbiModel getHexByNumber:[NSString stringWithFormat:@"%ld",offset]];
            NSData * startD = [AbiModel convertHexStrToData:startLen] ;
            [startData increaseLengthBy: 32 - startD.length ] ;
            [startData appendData:startD] ;
            [dataArr addObject:startData];
            
            NSString * value = model.value ;
            NSData * valueData = [value dataUsingEncoding:4] ;
            NSString * hexLen = [AbiModel getHexByNumber:[NSString stringWithFormat:@"%ld",valueData.length]];
            NSData * lenData = [AbiModel convertHexStrToData:hexLen] ;
            [muTab increaseLengthBy:32 - lenData.length ] ;
            [muTab appendData:lenData] ;
            [muTab appendData:valueData] ;
            NSInteger len = 0 ;
            if (valueData.length > 0 ) {
                
                len = (valueData.length / 32 ) * 32  + ((valueData.length % 32) > 0 ? 32 : 0 );
                [muTab increaseLengthBy:len - valueData.length ];
            }
            [multiData addObject:muTab];
            multiLen += muTab.length  ;
        }
    }
    [dataArr addObjectsFromArray:multiData];
    for (NSData * data in dataArr) {
        
        [allData appendData:data];
    }
    return allData   ;
}


@end
