// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract USDTContract {
    uint256 public totalSupply; // 发行量
    mapping(address => uint256) public balanceOf;
    event Burn(address indexed from, uint256 value);

    // 正如其名, 这个是烧币的.. ,用于把创建者的 token 烧掉
    function burn(uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value); // 必须要有这么多
        balanceOf[msg.sender] -= _value;
        totalSupply -= _value;
        emit Burn(msg.sender, _value);
        return true;
    }

    function burn() public view {
        //合约转账 黑洞合约
    }
}
