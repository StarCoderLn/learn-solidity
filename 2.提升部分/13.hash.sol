// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

/**
 * 1.单向性
 * 2.灵敏性
 * 3.高效性
 * 4.均一性
 * 5.抗碰撞性
 */
/**
 * 应用
 *1.生成数据唯一性
 *2.加密签名
 *3.安全加密其他的手段 SHA3【MD5】 SHA3-256 SHA2-256 keccak家族

 */
contract Hash {
    bytes32 _msg = keccak256(abi.encodePacked("0xAA"));

    // 唯一数字标识
    function hash(
        uint256 _num,
        string memory _string,
        address _addr
    ) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_num, _string, _addr));
    }

    // 弱抗碰撞性
    function weak(string memory string1) public view returns (bool) {
        return keccak256(abi.encodePacked(string1)) == _msg;
    }
}
