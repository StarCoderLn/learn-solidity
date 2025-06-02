// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Hash {
    function hash(
        uint256 _num,
        string memory _string,
        address _addr
    ) public pure returns (bytes32) {
        //sha256
        return keccak256(abi.encodePacked(_num, _string, _addr));
    }
}
