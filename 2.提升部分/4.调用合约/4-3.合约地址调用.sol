// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

interface ITest {
    function setX(uint256 x) external;

    function getX() external view returns (uint256);
}

contract CallContract {
    function callSetX(address _Address, uint256 x) external {
        ITest test = ITest(_Address);
        test.setX(x);
    }
}
