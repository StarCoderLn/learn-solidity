// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract RedPacket {
    //定义一个发红包的主体
    address payable public yideng;
    //红包的金额
    uint256 public totalAmount;
    //红包的数量
    uint256 public count;
    //是否是等额红包
    bool isEqual;
    //临时变量
    uint256 public temp = 0;

    mapping(address => bool) isGrabbed;

    constructor(uint256 c, bool _isEqual) payable {
        require(msg.value > 0, "amount must be greater than 0");
        //部署合约的人就是发红包的人
        yideng = payable(msg.sender);
        count = c;
        isEqual = _isEqual;
        totalAmount = msg.value;
    }

    //展示一下钱包的余额
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function grabRedPacket() public {
        require(count > 0, "red packet is empty");
        require(totalAmount > 0, "red packet is empty");
        require(!isGrabbed[msg.sender], "you have grabbed red packet");
        //已经抢过这个红包了
        isGrabbed[msg.sender] = true;

        if (count == 1) {
            temp = totalAmount / 1000000000000000000;
            payable(msg.sender).transfer(totalAmount);
        } else {
            if (isEqual) {
                uint256 amount = totalAmount / count;
                totalAmount -= amount;
                payable(msg.sender).transfer(amount);
            } else {
                //如果不是一个等额红包 计算一个10以内的随机数
                uint256 random = (uint256(
                    keccak256(
                        abi.encodePacked(
                            msg.sender,
                            yideng,
                            count,
                            totalAmount,
                            block.timestamp
                        )
                    )
                ) % 8) + 1;
                uint256 amount = (totalAmount * random) / 10;
                payable(msg.sender).transfer(amount);
                totalAmount -= amount;
            }
        }
        count--;
    }
}
