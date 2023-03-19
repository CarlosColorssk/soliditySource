// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract HashFunction {
    function hashKeccak256(
        string memory _text,
        uint _num,
        address _addr
    ) public pure returns (bytes32) {
  	    return keccak256(abi.encodePacked(_text, _num, _addr));
    }

    function hashPacked(
        string memory _text,
		uint _num,
        address _addr) public pure returns(bytes memory){
        return abi.encodePacked(_text, _num, _addr);
    }

  	function hashNotPacked(
      	string memory _text,
		uint _num,
        address _addr
    ) public pure returns (bytes memory) {
       return abi.encode(_text, _num, _addr);
    }


    // hash collision
    // 出现这种现象是： 因为传入的动态的值给abi.encodePacked，输入不一样，输出却一致
    // 可以就考虑使用abi.encode解决问题，或者使用更多的变量比如uint插入中间，来使输出不一样
    function collision(string memory _text, string memory _anotherText)
        public
        pure
        returns (bytes32)
    {
        return keccak256(abi.encode(_text, _anotherText));
    }
}

