// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Errror{
    uint[] public newArr;
    function testRequire(uint i ) public  {
        newArr.push(i);
        require(i<=10, "i is greater than 10");// return gas
        
    }

    function testAssert(uint i) public  {
        newArr.push(i);
        assert(i<=10); // not return gas
            
    }

    function testRevert(uint i) public  {
        newArr.push(i);
        if(i>10){
            revert("i is greater than 10"); // return gas
        }
    }
    error ErrorInfo(string message);//  cheaper than require
    function testRevertError(uint i) public  {
        newArr.push(i);
        if(i>10){
            revert ErrorInfo("i is greater than 10");// return gas
        }
    }
}