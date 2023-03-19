// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Product{
    uint public date;
    string public name;
    constructor(uint _date, string memory _name) payable{
        date = _date;
        name = _name;
    }
}

contract ProductFactory{
    Product[] public products;

    function create(uint _date, string memory _name) public payable{
        Product product = (new Product){value: msg.value}(_date, _name);
        products.push(product);
    }

    function create2(uint _date, string memory _name, bytes32 _salt) public payable{
        Product product = (new Product){value: msg.value, salt: _salt}(_date, _name);
        products.push(product);
    }

    function getProduct(uint index) public view returns(uint, string memory){
        Product product = products[index];
        return (product.date(), product.name());
    }


    function generateBytes32(string memory description) public pure returns(bytes32){
        return keccak256(abi.encodePacked(description));
    }

}