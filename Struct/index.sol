// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Struct {
    struct Car {
        uint year;
        string model;
        address owner;
    }

    Car public car;
    Car[] public cars;

    function init() public {
        // 这种初始化需要完整
        Car memory lanbo = Car({year: 1949, model: "Lamborghini", owner: msg.sender});

        Car memory tesla;
        tesla.year = 2020;
        tesla.model = "tesla";

        cars.push(lanbo);
        cars.push(tesla);
    }

    function buyCar(uint _index) public {
        Car storage _car = cars[_index];
        _car.owner = msg.sender;
    }

    function delCar(uint _index) public {
        Car storage _car = cars[_index];
        delete _car.owner;
        delete cars[_index];
    }
}