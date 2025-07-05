// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//Application Binary Interface
//ABI是一种JSON格式的接口描述语言，用于描述智能合约中的公共方法和事件

/**
 * 1.ABI编码 abi.encode, abi.encodePacked, abi.encodeWithSignature, abi.encodeWithSelector
 * 2.ABI解码 abi.decode
 */

// 数据是必须编码成字节码才能和智能合约交互！！！

//0xd6abfc7b000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000043078414100000000000000000000000000000000000000000000000000000000

contract ABIEncode {
    uint256 x = 10;
    address addr = 0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;
    string name = "0xAA";
    uint256[2] array = [5, 6];

    function encode() public view returns (bytes memory result) {
        result = abi.encode(x, addr, name, array);
    }

    function encodePacked() public view returns (bytes memory result) {
        result = abi.encodePacked(x, addr, name, array);
    }

    function encodeWithSignature() public view returns (bytes memory result) {
        result = abi.encodeWithSignature(
            "foo(uint256,address,string,uint256[2])",
            x,
            addr,
            name,
            array
        );
    }

    function encodeWithSelector() public view returns (bytes memory result) {
        result = abi.encodeWithSelector(
            //函数选择器
            //0xd6abfc7b000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000043078414100000000000000000000000000000000000000000000000000000000
            bytes4(keccak256("foo(uint256,address,string,uint256[2])")),
            x,
            addr,
            name,
            array
        );
    }

    function decode(
        bytes memory data
    )
        public
        pure
        returns (
            uint256 dx,
            address daddr,
            string memory dname,
            uint256[2] memory darray
        )
    {
        (dx, daddr, dname, darray) = abi.decode(
            data,
            (uint256, address, string, uint256[2])
        );
    }
}
