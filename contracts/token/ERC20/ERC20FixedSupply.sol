// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @dev 发行固定总量的代币，不可增发，不可销毁
 */
contract ERC20FixedSupply is ERC20 {
    constructor(
        string memory name, //代币名称
        string memory symbol, //代币缩写
        uint256 totalSupply //发行总量
    ) ERC20(name, symbol) {
        _mint(msg.sender, totalSupply * 10 ** decimals());
    }
}
