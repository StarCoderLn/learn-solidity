// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Pair {
    address public factory;
    address public token0;
    address public token1;

    constructor() payable {
        factory = msg.sender;
    }

    function initialize(address _tokenA, address _tokenB) external {
        require(msg.sender == factory, "UniswapV2: FORBIDDEN"); // sufficient check
        token0 = _tokenA;
        token1 = _tokenB;
    }
}

contract PairFactory {
    //通过token0和token1的地址，获取到对应的pair合约地址
    mapping(address => mapping(address => address)) public getPair;
    //所有的pair合约地址
    address[] public allPairs;

    function createPair(
        address _tokenA,
        address _tokenB
    ) external returns (address pairAddress) {
        Pair pair = new Pair();
        pair.initialize(_tokenA, _tokenB);
        pairAddress = address(pair);
        allPairs.push(pairAddress);
        getPair[_tokenA][_tokenB] = pairAddress;
        getPair[_tokenB][_tokenA] = pairAddress;
    }
}
