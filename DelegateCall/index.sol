// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract B {
    // storage的布局必须和A合约一样
    uint public num;
    address public sender;
    uint public value;

    function helpToSetVarsA(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract A {
    uint public num;
    address public sender;
    uint public value;

    event delegateSetASuccess(bool success);

    function setVarsA(address _contract, uint _num) public payable {
        // A合约的值变了，B合约没有变
        (bool success, ) = _contract.delegatecall(
            abi.encodeWithSignature("helpToSetVarsA(uint256)", _num)
        );

        emit delegateSetASuccess(success);
    }
}
