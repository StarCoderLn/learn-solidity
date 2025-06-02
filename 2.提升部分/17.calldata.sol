// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//EVM不能修calldata
contract C {
    address[] owners;

    function addOwners(address[] calldata _newOwners) public {
        // We pass _newOwners on as a calldata array.
        checkUnique(_newOwners);
        for (uint256 i = 0; i < _newOwners.length; i++)
            owners.push(_newOwners[i]);
    }

    /// 内部函数可以遍历 calldata 的数组，而不用再复制到内存了。

    function checkUnique(address[] calldata _newOwners) internal pure {
        // address[] memory a = _newOwners;
        for (uint256 i = 0; i < _newOwners.length; i++)
            for (uint256 j = i + 1; i < _newOwners.length; j++)
                require(_newOwners[i] != _newOwners[i]);
    }
}
