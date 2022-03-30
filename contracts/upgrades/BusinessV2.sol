// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

import "./BaseUpgradeable.sol";

/**
 * @dev 业务合约，用于测试合约可升级
 */
contract BusinessV2 is BaseUpgradeable{

    uint256 private value;

    /**
     * 初始化合约
     */
    function _Business_init(uint256 _value) public initializer {
        value = _value;
        _BaseUpgradeable_init();
    }

    // Stores a new value in the contract
    function store(uint256 newValue) public {
        value = newValue;
    }

    // Reads the last stored value
    function retrieve() public view returns (uint256) {
        return value;
    }

    // Increments the stored value by 1
    function increment() public {
        value = value + 1;
    }
}