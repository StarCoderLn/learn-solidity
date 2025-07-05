// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "hardhat/console.sol";

contract Hello {
    string public greeting;

    constructor() {
        greeting = "Hello, World!";
        console.log(greeting);
    }

    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
    }

    function say() public view returns (string memory) {
        return greeting;
    }
}
