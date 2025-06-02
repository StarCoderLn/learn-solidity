// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Test {
    // spend 662 gas
    function test(uint256[20] memory a) public pure returns (uint256) {
        return a[10] * 2;
    }

    // spend 317 gas
    function test2(uint256[20] memory a) external pure returns (uint256) {
        return a[10] * 2;
    }

    function test3(uint256[20] memory a) internal pure returns (uint256) {
        return a[10] * 2;
    }

    function test4(uint256[20] memory a) private pure returns (uint256) {
        return a[10] * 2;
    }
}
