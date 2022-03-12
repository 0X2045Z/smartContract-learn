// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/utils/TokenTimelock.sol";

/**
 * @dev 锁仓合约，发币的同时进行锁仓；一个锁仓合约对应一个受益人；
 */
contract ERC20WithTimeLock01 is TokenTimelock {
    constructor(
        IERC20 token, //ERC20代币合约地址
        address beneficiary, //受益人
        uint256 releaseTime //解锁时间戳
    ) TokenTimelock(token, beneficiary, releaseTime) {}
}