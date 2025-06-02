// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Call {
    // (bool,data) = 目标合约地址.call{gas:xxx,value:钱}(二进制编码);
    // 二进制编码 = abi.encodeWithSignature("setX(uint256)", 10,XX)
    //  (bool,data) = 目标合约地址.call{value:发送数额, gas:gas数额}(abi.encodeWithSignature("setX(uint256)", 10,XX));
    event Response(bool success, bytes data);

    function callSetX(address payable _addr, uint256 x) public {
        // (bool success, bytes memory data) = _addr.call{value: 0, gas: 1000000}(
        //     abi.encodeWithSignature("setX(uint256)", x)
        // );
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("setX(uint256)", x)
        );
        require(success, "call failed");
        emit Response(success, data);
    }

    function callGetX(address _addr) external returns (uint256) {
        (bool success, bytes memory data) = _addr.call(
            abi.encodePacked(bytes4(keccak256("getX()")))
        );
        require(success, "call failed");
        return abi.decode(data, (uint256));
    }
}
