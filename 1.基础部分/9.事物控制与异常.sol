/**
 * 1.revert 事物回滚 会消耗gas
 * 2.error 消耗gas最低
    2-1 error既可以告知用户抛出异常的原因，又能省gas。
 * 3.assert 错误判断 会消耗光gas assert(bool,cond_expr);
    3-1 一般不对外 内部变量判断 pure函数 用于检测系统级别的错误 代码层面的错误
    函数结尾或者函数头部 入参和必要条件检测
 * 4.require(bool cond_expr, string msg); 退还gas
    4-1 跟用户打交道的 require(input_var>100);
    4-2 合约掉合约 require(合约地址!=address(0));
 */

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
import "hardhat/console.sol";
error TransferNotOwner(uint256 count); // 自定义error

contract struct_demo {
    User user;

    constructor() {
        user.name = "laoyuan";
    }

    function setUser(
        string memory _name,
        uint8 _age,
        string memory _sex
    ) public {
        // if(_name !== user.name){
        //     user.name = _name;
        // }
        // require(
        //     keccak256(abi.encodePacked(user.name)) !=
        //         keccak256(abi.encodePacked(_name)),
        //     "user send name is not allowed"
        // );
        if (
            keccak256(abi.encodePacked(user.name)) ==
            keccak256(abi.encodePacked(_name))
        ) {
            revert TransferNotOwner(_age);
            // revert`sss`;
        }
        user.name = _name;

        user.age = _age;
        user.sex = _sex;
    }
}
