// 1.状态变量
// 1.1.存储状态变量
// 1.2.内存状态变量
// 1.3.常量状态变量
// 1.4.视图状态变量
// 1.5.公共状态变量
// 1.6.私有状态变量
// 1.7.内部状态变量
// 1.8.外部状态变量

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract hello {
    string public Msg;
    uint256 private age;
    uint256 public difficulty;
    bytes4 constant fid = 0xfa913621;

    constructor() {
        Msg = "Hello Solitidy";
        age = 18;
        difficulty = block.difficulty;
    }

    function getDoubleAge() public view returns (uint256) {
        uint256 dage = age * 3;
        return dage;
    }
}
