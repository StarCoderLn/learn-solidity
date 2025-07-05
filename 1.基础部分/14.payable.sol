// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract deposit_demo {
    address owner;

    constructor() {
        //部署合约的人
        owner = msg.sender;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function deposit() public payable {
        require(msg.value > 0, "must be greater than 0");
    }

    function withdraw(uint256 amount) public payable {
        require(msg.sender == owner, "only owner can withdraw");
        require(amount <= address(this).balance, "not enough balance");
        //调用合约的人
        payable(msg.sender).transfer(amount);
    }
}
