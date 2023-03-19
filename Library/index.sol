// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

library Math {
    function add(uint x, uint y) internal pure returns (uint z) {
        return x + y;
    }
}

contract TestMath {
    function testSquareRoot(uint x,uint y) public pure returns (uint) {
        return Math.add(x, y);
    }
}

// Array function to delete element at index and re-organize the array
// so that their are no gaps between the elements.
library Array {
    function remove(uint[] storage arr, uint index) public {
        // Move the last element into the place to delete
        require(arr.length > 0, "Can't remove from empty array");
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }
}

library SetAsset {
    struct Data{
        mapping(address=>uint) balances;
    }
    function deposite(Data storage self, address _addr, uint _value ) public {
        self.balances[_addr] += _value;
    }
}

contract TestArray {
    using Array for uint[];
    using SetAsset for SetAsset.Data;


    SetAsset.Data testType;// 因为struct没有 getter不能直接提取所以不能public,存在storage所以直接访问即可
    uint[] public arr;

    function testArrayRemove() public {
        for (uint i = 0; i < 3; i++) {
            arr.push(i);
        }

        arr.remove(1);

        assert(arr.length == 2);
        assert(arr[0] == 0);
        assert(arr[1] == 2);
    }

    function deposite() external payable{
        testType.deposite(address(this), msg.value);
    }

    function getBalances() external view  returns(uint){
        return testType.balances[address(this)];
    }
}
