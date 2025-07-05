// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract array_demo {
    //定长数组 T[N]
    string[5] public names;

    //动态数组
    uint256[] public ages;

    constructor() {
        names[0] = "test";
        //定长数组不允许push
        // names.push("test1");

        //动态数组不允许不存在的下标
        // ages[0] = 110;
        ages.push(111);
    }

    function setNames(string memory name, uint256 index) public {
        names[index] = name;
    }

    function getLength() external view returns (uint256, uint256) {
        return (names.length, ages.length);
    }
}
