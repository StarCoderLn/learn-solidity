// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SoldityTest {
    function callHello(address addr) external view returns (string memory) {
        (bool success, bytes memory data) = addr.staticcall(
            abi.encodeWithSignature("hello()")
        );
        require(success, "call failed");
        return abi.decode(data, (string));
    }
}
