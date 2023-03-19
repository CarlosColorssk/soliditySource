// SPDX-License-Identifier: MIT
pragma solidity  ^0.8.13;

contract BaseTypes {
    // uint 无符号整数：非负整数
    uint8 public u8 = 2;// 0 - 2**8 - 1
    uint256 public  u256 = 345; //0 - 2***256 - 1
    uint public  u = 345;// uint256简写
    //int 有符号
    int8 public i8 = -1;// - 2 **7 -1- 2**7 -1
    int256 public  i256 = -345;// - 2 **255 -1- 2**255 -1
    int public i  = -345; // 同理 int256;

    // 字节 bytes
    bytes1 a = 0xb5;
    bytes1 b = 0x56;

    // 地址 address
    address public  addr = msg.sender;

    // 字符串 string
    string public str  = "hi!";

    //function 方法
    function hello() public pure  returns(string memory){
        return "hello world";
    }


// function 方法
    uint uDefault;
    int iDefault;
    bool bDefault;
    address addrDefault;
    bytes1 bytesDeafult; 
    string strDefault;

    function getDefaultValue()public view returns(uint, int, bool, address, bytes1, string memory){
        return (uDefault, iDefault, bDefault, addrDefault, bytesDeafult, strDefault);
    }
}