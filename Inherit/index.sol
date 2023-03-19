// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


contract A {
    function foo() public pure virtual returns (string memory) {
        return "A";
    }
}
// 表示符is表示继承
contract B is A {
    // override A.foo()
    function foo() public pure virtual override returns (string memory){
        return "B";
    }
}

contract C is A {
    // overrid A.foo();
    function foo() public pure virtual override returns (string memory){
        return "C";
    }
}

// 多继承
// 最远继承的原则
contract D is B, C{
    function foo() public pure override(B,C) returns (string memory) {
        return super.foo();
    }
}
// 比较D E 继承的B C交换顺序没问题是因为不违反（most base-like）最基本 继承法则， 换句话是就是 B C同级，所以没问题
contract E is C, B{
     function foo() public pure override(C, B) returns (string memory) {
        return super.foo();
    }
}
// 看一个违反最基本法则的
// contract F is B, A{
//      function foo() public pure override(B, A) returns (string memory) {
//         return super.foo();
//     }
// }

// 所以有效的继承关系满足： 从“最基本”到“最派生”排序， 本节案例中B 继承A， 所以A相对于B是最基本的
// 所以上面应该这样写
contract F is A, B {
         function foo() public pure override(B, A) returns (string memory) {
        return super.foo();
    }
}