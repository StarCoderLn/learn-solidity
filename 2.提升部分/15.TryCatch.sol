// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract OnlyEven {
    constructor(uint256 a) {
        require(a != 0, "invalid number");
        assert(a != 1);
    }

    function onlyEven(uint256 b) external pure returns (bool success) {
        // 输入奇数时revert
        require(b % 2 == 0, "Ups! Reverting");
        success = true;
    }
}

//try-catch只能被用于external函数或创建合约时constructor（被视为external函数）的调用
contract TryCatch {
    // 成功event
    event SuccessEvent();
    // 失败event
    event CatchEvent(string message);
    event CatchByte(bytes data);

    // 声明OnlyEven合约变量
    OnlyEven even;

    constructor() {
        even = new OnlyEven(2);
    }

    function execute(uint256 amount) public returns (bool success) {
        try even.onlyEven(amount) returns (bool _success) {
            emit SuccessEvent();
            return _success;
        } catch Error(string memory reason) {
            emit CatchEvent(reason);
        }
    }

    //当你new的时候捕获到错误
    function executeNew(uint256 a) external returns (bool success) {
        try new OnlyEven(a) returns (OnlyEven _even) {
            success = _even.onlyEven(a);
            emit SuccessEvent();
        } catch Error(string memory reason) {
            // catch失败的 revert() 和 require()
            emit CatchEvent(reason);
        } catch (bytes memory reason) {
            // finally 理解成
            // catch失败的 assert()
            emit CatchByte(reason);
        }
    }
}
