// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

abstract contract Math{
    function add(uint a, uint b) public virtual returns(uint);

    function muli(uint a, uint b) public pure returns (uint){
        return a * b;
    }
}

// abstract contract CallMath is Math{
//     function muliAnother(uint a, uint b, uint c) public pure returns(uint){
//         return muli(a, b) * c;
//     }
//     // function add(uint a, uint b) public pure override  returns (uint) {
//     //     return a + b;
//     // }
// }

contract CallMath is Math{
    function muliAnother(uint a, uint b, uint c) public pure returns(uint){
        return muli(a, b) * c;
    }
    function add(uint a, uint b) public pure override  returns (uint) {
        return a + b;
    }
}

// contract CallAgain is CallMath {
//     function add(uint a, uint b) public pure override  returns (uint) {
//         return a + b;
//     }
// }

// contract Call {
//     Math math;
//     function cal(uint a, uint b) public  returns (uint) {
//         // error
//         //math = new Math();
//         //true
//         math = new CallMath();
//         return math.add(a, b);
//     }
// }