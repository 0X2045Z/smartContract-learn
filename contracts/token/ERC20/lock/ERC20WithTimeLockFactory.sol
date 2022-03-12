// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.2;

import './ERC20WithTimeLock02.sol';

/**
 * @dev 通过工厂合约部署锁仓合约，实现分批锁仓，并记录所有的锁仓信息
 */
contract ERC20WithTimeLockFactory {

    // 受益人mapping:收益人地址=>锁仓合约地址[]
    mapping(address => ERC20WithTimeLockInfo[]) public getERC20WithTimeLock;

    struct ERC20WithTimeLockInfo {
        address ERC20WithTimeLockAddress; // 锁仓合约地址
        address tokenAddress; // 被锁Token地址
        uint256 releaseTime; // 解锁时间戳
    }

    /**
     * @dev
     * @param
     *   _token : 被锁的ERC20地址
     *   _beneficiary： 受益人地址
     *   _releaseTime： 解锁时间戳
     */
    function createERC20WithTimeLock(
        address _token, 
        address _beneficiary, 
        uint256 _releaseTime) external returns (address _ERC20WithTimeLockAddr){
            // bytecode & salt
            bytes memory bytecode = type(ERC20WithTimeLock02).creationCode;
            bytes32 salt = keccak256(abi.encodePacked(msg.sender, msg.sender));
            // deploy
            _ERC20WithTimeLockAddr = deploy(bytecode, salt);
            IERC20WithTimeLock02(_ERC20WithTimeLockAddr).
                    _ERC20WithTimeLock02_init(_token, _beneficiary, _releaseTime);
            // 更新受益人mapping
            ERC20WithTimeLockInfo[] storage _linfos = getERC20WithTimeLock[_beneficiary];
            _linfos.push(ERC20WithTimeLockInfo({
                ERC20WithTimeLockAddress: _ERC20WithTimeLockAddr,
                tokenAddress: _token,
                releaseTime: _releaseTime
            }));
            getERC20WithTimeLock[_beneficiary] = _linfos;
    }

    /**
     * @dev 获取受益人所有锁仓合约及相关信息
     * @param _beneficiary 受益人地址  
     */
    function getERC20WithTimeLockInfos(address _beneficiary) 
    external 
    view 
    returns(ERC20WithTimeLockInfo[] memory eRC20WithTimeLockInfos){
        eRC20WithTimeLockInfos = getERC20WithTimeLock[_beneficiary];
    }
    
    /**
     * @dev 工厂合约部署锁仓合约
     */
    function deploy(bytes memory code, bytes32 salt) 
    internal 
    returns (address addr) {
        assembly {
            addr := create2(0, add(code, 0x20), mload(code), salt)
            if iszero(extcodesize(addr)) { revert(0, 0) }
        }
    }
}