// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract FunctionModifier {
    // We will use these variables to demonstrate how to use
    // modifiers.
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor() {
        // Set the transaction sender as the owner of the contract.
        owner = msg.sender;
    }

    // Modifier to check that the caller is the owner of
    // the contract.
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        // Underscore is a special character only used inside
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
        _;
    }

    // Modifiers can take inputs. This modifier checks that the
    // address passed in is not the zero address.
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner;
    }

    // Modifiers can be called before and / or after a function.
    // This modifier prevents a function from being called while
    // it is still executing.
    modifier noReentrancy() {
        require(!locked, "No reentrancy");

        locked = true;
        _;
        locked = false;
    }

    function decrement(uint i) public noReentrancy {
        x -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }
	  // 除法运算
    function division(uint256 opt1, uint256 opt2) public checkZero(opt2) pure returns(uint256){
        return opt1 / opt2;
    }
    
    // 检查除数是否为0
    modifier checkZero(uint256 divisor) {
        require (divisor != 0, "divisor can't be 0");
        _;
    }
}


contract different{
    address owner;
    uint256 public a;
    
    constructor() {
        owner = msg.sender;
    }
    // output是10
    function test(uint num) public checkPara(num) returns(uint256) {
        a = 10;
        return a;
    }
    
    // 最后public a 存储的值是100 因为， 及时return 之后， modifier也会继续执行下去 
    modifier checkPara(uint number) {
        a = 1;
        _;
        a = 100;
    }
}
