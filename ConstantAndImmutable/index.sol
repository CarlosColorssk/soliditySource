// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Constant {
    address public constant my_address = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    address public immutable owner;

    constructor() {
        owner = msg.sender;
    }
}