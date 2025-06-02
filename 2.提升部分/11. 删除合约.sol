// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract DeleteContract {
    //析构函数，销毁合约时被调用
    function deleteContract() external {
        // 调用selfdestruct销毁合约，并把剩余的ETH转给msg.sender
        selfdestruct(payable(msg.sender));
    }
}
