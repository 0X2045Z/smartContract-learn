// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/security/ReentrancyGuardUpgradeable.sol";

/**
* @dev Introduce a public contract here.
*
*/
contract BaseUpgradeable is OwnableUpgradeable, PausableUpgradeable, ReentrancyGuardUpgradeable {

    /**
     * @dev initial method.
     */
    function _BaseUpgradeable_init() public initializer {
        __Ownable_init();
        __Pausable_init();
        __ReentrancyGuard_init();
    }
}