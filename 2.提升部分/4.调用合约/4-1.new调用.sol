// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import { Test } from "./Test.sol";

contract Import {
    Test test = new Test();

    function test() public {
        test.hello();
    }
}
