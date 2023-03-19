// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

interface Iexample {
        function doSomething(string memory _str)external pure returns(string memory _outPutStr);
}
contract InterfaceExample is Iexample{
        function doSomething(string memory _str)external pure returns(string memory _outPutStr){
            return _str;
        }
}

interface MinimalERC20 {
    // 在interface中标注下我们想使用的方法
    function balanceOf(address account) external view returns (uint256);
}
contract CustomizedERC20 is ERC20{
    constructor(uint256 initialSupply) ERC20("CustomizedToken", "GLEN") {
        _mint(msg.sender, initialSupply);
    }
}

contract MyContract {
    MinimalERC20 externalContract;

    constructor(address _externalContract) {
        // 实例话一个MinimalERC20的合约
        externalContract = MinimalERC20(_externalContract);
    }

    function mustHaveSomeBalance() view public returns(uint _balance){
        // 需要调用者拥有token
        uint balance = externalContract.balanceOf(msg.sender);
        require(balance > 0, "You don't own any tokens of external contract");
        return balance;
    }
}