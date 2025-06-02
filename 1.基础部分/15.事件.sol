// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Events {
    mapping(address => uint256) public _balances;
    //EVM  日志的抽象 Ether.js交互
    //带有indexed属性的这个状态是存储在 一个 topics
    // 0 索引
    // {
    //     topics:[
    //         0:函数方法的签名
    //         1.indexed
    //         2.to
    //         3.最后indexed
    //     ]
    // }
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    function _transfer(address from, address to, uint256 amount) external {
        //转账地址转一些基础的代币
        _balances[from] = 1000000;
        _balances[from] -= amount;
        _balances[to] += amount;
        emit Transfer(from, to, amount);
    }
}
