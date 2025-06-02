// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.0.0) (token/ERC20/IERC20.sol)

pragma solidity >=0.7.0 <0.9.0;

/**
 * @dev ERC20合约接口
 */
interface IERC20 {
    /**
     * 释放条件：当value单位的货币从账户from转移到账户to时，触发此事件
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * 释放条件：当owner账户授权spender账户可以从自己的账户转移value单位的货币时，触发此事件
     */
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );

    /**
     * @dev 返回代币的总供给 一共mint 1万个 yideng token
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev 返回账户accout所持有的代币数量 余额
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev 转账amount个代币到账户to
     * 如果成功了 返回true
     */
    function transfer(address to, uint256 value) external returns (bool);

    /**
     * @dev 返回账户owner授权给spender账户可以从自己的账户转移的代币数量
     */
    function allowance(
        address owner,
        address spender
    ) external view returns (uint256);

    /**
     * @dev 返回owner账户授权给spender账户额度 默认是0
     * 当approve或transferFrom被调用时候 allowance发生变化
     */
    function approve(address spender, uint256 value) external returns (bool);

    /**
     * @dev 通过授权机制 从from账户到to账户转移amount个代币 转移的这部分钱会扣除allowance
     */
    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);
}
