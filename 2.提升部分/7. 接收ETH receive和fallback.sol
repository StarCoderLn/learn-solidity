/* 
    触发fallback() 还是 receive()?
           接收ETH
              |
         msg.data是空？
            /  \
          是    否
          /      \
receive()存在?   fallback()
        / \
      是  否
    /     \
receive()  fallback   
*/

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Fallback {
    event receivedCalled(address Sender, uint256 Vallue);
    event fallbackCalled(address Sender, uint256 Value, bytes Data);

    receive() external payable {
        //不要去写 业务太复杂执行时间长
        emit receivedCalled(msg.sender, msg.value);
    }

    fallback() external payable {
        emit fallbackCalled(msg.sender, msg.value, msg.data);
    }
}
