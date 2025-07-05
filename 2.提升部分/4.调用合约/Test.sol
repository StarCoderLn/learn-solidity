// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
import "hardhat/console.sol";

contract Test {
    event Log(string msg);

    function hello() public {
        console.log("11111111");
        emit Log("test");
    }
}
