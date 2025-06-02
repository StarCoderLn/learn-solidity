contract TryCatch {
    //当你new的时候捕获到错误
    function executeNew(uint256 a) external returns (bool success) {
        try new OnlyEven(a) returns (OnlyEven _even) {} catch Error(
            string memory reason
        ) {} catch (bytes memory reason) {
            emit CatchByte(reason);
        }
    }
}
