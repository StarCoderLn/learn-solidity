// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// delegatecall和call类似，都是低级函数
// call: B call C, 语境为 C (msg.sender = B, C中的状态变量受影响)
// delegatecall: B delegatecall C, 语境为B (msg.sender = A, B中的状态变量受影响)

contract B {
    uint256 public num;
    address public sender;
    event Response(bool success, bytes data);

    // 通过call来调用C的setVars()函数，将改变合约C里的状态变量
    function callSetVars(address _addr, uint256 _num) external payable {
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
        require(success, "call failed");
        emit Response(success, data);
    }

    // 通过delegatecall来调用C的setVars()函数，将改变合约B里的状态变量
    function delegatecallSetVars(address _addr, uint256 _num) external payable {
        (bool success, bytes memory data) = _addr.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
        require(success, "call failed");
        emit Response(success, data);
    }
}
