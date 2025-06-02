// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Hello {
    function addAssembly(uint256 x, uint256 y) external pure {
        assembly {
            let result := add(x, y)
            mstore(0x00, result)
            return(0x00, 0x20)
        }
    }
}
