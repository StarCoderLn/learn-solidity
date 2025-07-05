// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract random_demo {
    function getRandom() public view returns (uint256) {
        bytes32 hashA = keccak256(
            abi.encode(block.timestamp, msg.sender, block.number, "test")
        );
        return uint256(hashA);
    }

    function isEqual(
        string memory a,
        string memory b
    ) public pure returns (bool) {
        //判断是不是空
        bytes memory aa = bytes(a);
        bytes memory bb = bytes(b);
        if (aa.length == 0 || bb.length == 0) return false;
        if (aa.length != bb.length) {
            return false;
        }
        for (uint256 i = 0; i < aa.length; i++) {
            if (aa[i] != bb[i]) return false;
        }
        return true;
    }
}
