//
//  main.m
//  Abi_Tool
//
//  Created by Wind on 8/10/20.
//  Copyright © 2020 Wind. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AbiModel.h"
#import "AbiModel+Helper.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        AbiModel * addsAbi = [[AbiModel alloc] init];
        addsAbi.value = @"b7E23Cd737Ea2096d12049cb1D188A53ADB64B75" ;
        addsAbi.addrType = YES ;
        NSData * addData = [AbiModel abiDataWithAbiModel:@[addsAbi]];
        NSLog(@"addData %@", [AbiModel convertDataToHexStr:addData]);
        
        
        AbiModel * stringAbi = [[AbiModel alloc] init];
        stringAbi.value = @"AbiModelAbiModelAbiModelAbiModelAbiModelAbiModelAbiModelAbiModelAbiModel" ;
        NSData * stringData = [AbiModel abiDataWithAbiModel:@[stringAbi]];
        NSLog(@"stringData %@", [AbiModel convertDataToHexStr:stringData]);

        NSData * adds_str_Data = [AbiModel abiDataWithAbiModel:@[addsAbi,stringAbi]];
        NSLog(@"adds_str_Data %@", [AbiModel convertDataToHexStr:adds_str_Data]);
        
        NSData * str_Add_Data = [AbiModel abiDataWithAbiModel:@[stringAbi,addsAbi]];
        NSLog(@"str_Add_Data %@", [AbiModel convertDataToHexStr:str_Add_Data]);
        
        AbiModel * numAbi = [[AbiModel alloc] init];
        numAbi.value = @"999999" ;
        numAbi.numberType = YES ;
        NSData * numAbiData = [AbiModel abiDataWithAbiModel:@[numAbi]];
        NSLog(@"numAbiData %@", [AbiModel convertDataToHexStr:numAbiData]);
        
        AbiModel * byteAbi = [[AbiModel alloc] init];
        byteAbi.value = @"60806040523480156200001157600080fd5b5060405162002" ;
        byteAbi.bytesData = YES ;
        NSData * byteAbiData = [AbiModel abiDataWithAbiModel:@[byteAbi]];
        NSLog(@"byteAbiData %@", [AbiModel convertDataToHexStr:byteAbiData]);
        // Setup code that might create autoreleased objects goes here.
    }
    return NSApplicationMain(argc, argv);
}



