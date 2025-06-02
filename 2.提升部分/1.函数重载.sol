// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract hello {
    function saySomething() public pure returns (string memory) {
        return "hello world";
    }

    function saySomething(
        string memory something
    ) public pure returns (string memory) {
        return something;
    }
}
