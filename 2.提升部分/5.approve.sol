// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contract/token/ERC20/ERC20.sol";

contract exampleContract {
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    ERC20 USDTToken = ERC20("0xdac17f958d2ee523a2206206994597c13d831ec7");

    function approve(uint256 _amount) {
        USDTToken.approve(address(this), _amount);
    }

    function approve(address _spender, uint256 _value) public returns (bool) {
        allowance[msg.sender][_spender] = _value;
        return true;
    }
}
