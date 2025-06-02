// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract modifier_demo {
    address public admin;
    uint256 public amount;

    constructor() {
        admin = msg.sender;
        amount = 101;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "only admin");
        _;
    }

    function setCount(uint256 _amount) public onlyAdmin {
        amount = _amount;
    }
}
