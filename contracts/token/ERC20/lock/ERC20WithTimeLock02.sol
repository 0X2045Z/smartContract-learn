// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.2;

import "./interface/IERC20WithTimeLock02.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/utils/TokenTimelockUpgradeable.sol";

/**
 * @dev 锁仓合约，发币的同时进行锁仓；一个锁仓合约对应一个受益人；
 */
contract ERC20WithTimeLock02 is IERC20WithTimeLock02, TokenTimelockUpgradeable {

    /**
     * @dev
     * @param
     *   _token : 被锁的ERC20地址
     *   _beneficiary： 受益人地址
     *   _releaseTime： 解锁时间戳
     */
    function _ERC20WithTimeLock02_init(
        address _token, 
        address _beneficiary, 
        uint256 _releaseTime) public override onlyInitializing {
            IERC20Upgradeable token = IERC20Upgradeable(_token);
            __TokenTimelock_init(token, _beneficiary, _releaseTime);
        }
}