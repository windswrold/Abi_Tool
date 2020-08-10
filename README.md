# Abi_Tool
eth abidata blockchain
ethereum abidata with ios

ex:
        AbiModel * addsAbi = [[AbiModel alloc] init];
        addsAbi.value = @"b7E23Cd737Ea2096d12049cb1D188A53ADB64B75" ;
        addsAbi.addrType = YES ;
        NSData * addData = [AbiModel abiDataWithAbiModel:@[addsAbi]];
       
       //000000000000000000000000b7e23cd737ea2096d12049cb1d188a53adb64b75
        
        AbiModel * stringAbi = [[AbiModel alloc] init];
        stringAbi.value = @"AbiModelAbiModelAbiModelAbiModelAbiModelAbiModelAbiModelAbiModelAbiModel" ;
        NSData * stringData = [AbiModel abiDataWithAbiModel:@[stringAbi]];
        
        //0000000000000000000000000000000000000000000000000000000000000020
        //0000000000000000000000000000000000000000000000000000000000000048
        //4162694d6f64656c4162694d6f64656c4162694d6f64656c4162694d6f64656c
        //4162694d6f64656c4162694d6f64656c4162694d6f64656c4162694d6f64656c
        //4162694d6f64656c000000000000000000000000000000000000000000000000

        NSData * adds_str_Data = [AbiModel abiDataWithAbiModel:@[addsAbi,stringAbi]];

        //000000000000000000000000b7e23cd737ea2096d12049cb1d188a53adb64b75
        //0000000000000000000000000000000000000000000000000000000000000040
        //0000000000000000000000000000000000000000000000000000000000000048
        //4162694d6f64656c4162694d6f64656c4162694d6f64656c4162694d6f64656c
        //4162694d6f64656c4162694d6f64656c4162694d6f64656c4162694d6f64656c
        //4162694d6f64656c000000000000000000000000000000000000000000000000


        NSData * str_Add_Data = [AbiModel abiDataWithAbiModel:@[stringAbi,addsAbi]];
        
        0000000000000000000000000000000000000000000000000000000000000040
        000000000000000000000000b7e23cd737ea2096d12049cb1d188a53adb64b75
        0000000000000000000000000000000000000000000000000000000000000048
        4162694d6f64656c4162694d6f64656c4162694d6f64656c4162694d6f64656c
        4162694d6f64656c4162694d6f64656c4162694d6f64656c4162694d6f64656c
        4162694d6f64656c000000000000000000000000000000000000000000000000      

        AbiModel * numAbi = [[AbiModel alloc] init];
        numAbi.value = @"999999" ;
        numAbi.numberType = YES ;
        NSData * numAbiData = [AbiModel abiDataWithAbiModel:@[numAbi]];
        NSLog(@"numAbiData %@", [AbiModel convertDataToHexStr:numAbiData]);
        
        00000000000000000000000000000000000000000000000000000000000f423f
        
        AbiModel * byteAbi = [[AbiModel alloc] init];
        byteAbi.value = @"60806040523480156200001157600080fd5b5060405162002" ;
        byteAbi.bytesData = YES ;
        NSData * byteAbiData = [AbiModel abiDataWithAbiModel:@[byteAbi]];
        NSLog(@"byteAbiData %@", [AbiModel convertDataToHexStr:byteAbiData]);
        
        0000000000000000000000000000000000000000000000000000000000000020
        0000000000000000000000000000000000000000000000000000000000000018
        60806040523480156200001157600080fd5b5060405162000000000000000000
        
  learn url : https://solidity-cn.readthedocs.io/zh/develop/abi-spec.html
        
        
