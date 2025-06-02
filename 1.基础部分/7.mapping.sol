// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract map_demo {
    mapping(address => string) addr_names;

    constructor() {
        //部署合约的人 owner
        addr_names[msg.sender] = "laoyuan";
    }

    function setNames(string memory _name) public {
        addr_names[msg.sender] = _name;
    }

    function getNames() public view returns (string memory) {
        return addr_names[msg.sender];
    }
}
