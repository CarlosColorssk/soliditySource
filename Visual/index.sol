// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Visual {
    // private
    function privateFunc() private pure returns(string memory) {
        return "private function";
    }
    // public
    function testPrivateFunc() public pure returns (string memory){
        return privateFunc();
    }
    // internal
    function internalFunc() internal  pure returns(string memory) {
        return "internal function";
    }

    function testINternalFunc() public pure returns (string memory){
        return internalFunc();
    }

    function externlaFunc() external pure returns (string memory){
        return "external function";
    }
}

contract VisualTwo is Visual {
    function testInternalFunc2() public pure returns(string memory){
        return internalFunc();
    }

    // function testExternalFunction() public pure returns(string memory){
    //     return externlaFunc();
    // }
}

contract testExternal {
    Visual visualContract;
    constructor(address _contract){
        visualContract = Visual(_contract);
    } 
    function testExternalFun() public view returns(string memory){
        return visualContract.externlaFunc();
    }
}