// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
contract A1{
  uint[] public testA = [1, 2, 3];

  function changeTest() public {
    uint[] storage testB = testA;
  	testA[0] = 100;
  }
}
contract A2{
  uint[] public testA = [1, 2, 3];

  function changeTest() public {
    uint[] memory testB = testA;
  	testA[0] = 100;
  }
}


contract A3{
    function fnTestA(bool _isCallTestB) pure public returns(uint[] memory){
        uint[] memory testA = new uint[](3);
        testA[0] = 1;
        testA[1] = 2;
        testA[2] = 3;
        if(_isCallTestB){
            fnTestB(testA);
        }
        return testA;
    }
    function fnTestB(uint[] memory _testA) pure internal returns(uint[] memory){
        uint[] memory testB = _testA;
        testB[0] = 100;
        return testB;
    }

}


contract A4{
    uint[] testC = [1,2, 3];
    function fnTestA() public returns(uint[] memory){
        testC[0] = 0;
        uint[] memory testA = new uint[](3);
        testA[0] = 100;
        testA[1] = 200;
        testA[2] = 300;
        testC = testA;
        testA[0] = 777;
        return testA;
    }
    function getTestC()view public returns(uint[] memory){
        return testC;
    }
}