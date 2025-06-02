// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "./libs/Test.sol";

contract DoTest is Test {
    uint256[20] a;
    uint256 public xx;

    constructor() {
        a[10] = 3;
    }

    function test_1() external returns (uint256) {
        xx = test(a);
        return xx;
    }

    function test_2() public returns (uint256) {
        xx = this.test2(a); // <-- use this.
        return xx;
    }

    function test_3() external returns (uint256) {
        xx = test3(a);
        return xx;
    }

    function test_4() external returns (uint256) {
        xx = test4(a); // <-- compile error
        return xx;
    }
}
