// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./Test.sol";

contract test is Test {
    function callParentSuper() public {
        super.hello();
    }
}
