// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Variables {

    string public text = "hello world";

    uint public num = 123;


    function dosomething() view public returns(uint, uint,address){
        uint i = 456;

        uint timeStamp = block.timestamp;
        address sender = msg.sender;
        return (i, timeStamp, sender);
    }
}