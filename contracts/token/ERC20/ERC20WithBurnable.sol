// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

/**
 * @dev 发行可销毁代币
 */
contract ERC20WithBurnable is ERC20Burnable {
    constructor(
        string memory name, 
        string memory symbol, 
        uint256 totalSupply
    ) ERC20(name, symbol) {
        _mint(msg.sender, totalSupply * 10 ** decimals());
    }
}