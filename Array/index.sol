
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Array {
    // 初始化数组
    uint[] public arr;
    uint[] public arr2 = [1, 2, 3];

    // 定长度数组， 所有元素初始化都是0
    uint[10] public fixedArr;

    function get(uint i) public view returns (uint){
        return arr[i];
    }


    // solidity 可以返回整个 array
    // 所以要避免使用长度可以无限增长的数组, 因为array会有loop, 频繁使用增加gas，如果超出上限， function 会unusable
    function getArr() public view returns (uint[] memory){
        return arr;
    }

    function push(uint i) public{
        // 添加数据到数组中， 长度会自动加1
        arr.push(i);
    }


    // 最后一个元素出栈, 长度会减1
    function pop() public {
        arr.pop();
    }

    function getLength() public view returns (uint){
        return arr.length;
    }

    // 删除
    function remove(uint index) public {
        // 只会把元素设置成默认值， 不会改变数组长度
        delete arr[index];
    }

    // 创建一个存储在memory中的数组， 只能设置成固定长度
    function createArrayInmemory() pure public  returns(uint[] memory _a)  {
        uint[] memory a  = new uint[](3);
        // error
        // a[3] = 1;
        return a;
    }

}

contract removeElement{
    uint[] public arr;
    // 因为删除会有空缺的元素,1：用最后一个元素换掉要删除的元素,最后一个元素再pop掉
    function remove(uint index) public {
        arr[index] = arr[arr.length -1];
        arr.pop();
    }

    //测试下
    function test() public {
        arr = [1, 2, 3, 4];
        remove(1);

        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);
    }
}

// 不改变原来顺序的删除
contract arrayRemoveByshifting {
    // [1, 2, 3, 4, 5, 6] -- remove(0) --> [2, 3, 4, 5, 6, 6] --> [2, 3, 4, 5, 6]
    uint[] public arr;

    function remove(uint index) public {
        require(index < arr.length, "index invalid");
        for(uint i = index; i < arr.length - 1; i++){
            arr[i] = arr[i+1];
        }
        arr.pop();
    }
    // 删除时忽略映射和删除数组中某个位置的值仅初始化改值而不重组数组都是考虑到节省gas
    function test(uint index) public returns(uint[] memory){
        arr = [1, 2, 3, 4, 5, 6];
        remove(index);
        return arr;
    }
}