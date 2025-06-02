// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "./IERC20.sol";

contract ERC20 is IERC20 {
    //合约拥有人
    address public owner;
    //钱包的键值对 地址-》钱包余额
    mapping(address => uint256) public override balanceOf;

    //approve之后的 地址对应的额度
    mapping(address => mapping(address => uint256)) public override allowance;

    //代币总供给
    uint256 public override totalSupply;

    //代币名称
    string public name;
    //代币符号
    string public symbol;
    //代币精度
    uint8 public decimals = 18;

    constructor(string memory _name, string memory _symbol) {
        owner = msg.sender;
        name = _name;
        symbol = _symbol;
    }

    //合约 或者 合约的拥有人
    function transfer(
        address recipient,
        uint256 amount
    ) external override returns (bool) {
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function approve(
        address spender,
        uint256 amount
    ) external override returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Transfer(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external override returns (bool) {
        allowance[sender][msg.sender] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function mint(address recipient, uint256 amount) external {
        //只有部署合约的人 才能调用mint方法 增发YD币
        require(msg.sender == owner, "ERC20: must be owner");
        totalSupply += amount;
        balanceOf[recipient] += amount;
        emit Transfer(address(0), recipient, amount);
    }

    function burn(uint256 amount) external {
        require(msg.sender == owner, "not owner");
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }
}
