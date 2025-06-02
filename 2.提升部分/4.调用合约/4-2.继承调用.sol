// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./Yideng.sol";

contract test is Loayuan {
    function callParentSuper() public {
        super.hello();
    }
}
