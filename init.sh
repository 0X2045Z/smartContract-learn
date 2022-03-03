#!/bin/bash 

# Initialize project dependencies
npm init --yes
npm install --save-dev hardhat
npm install @openzeppelin/contracts --save
npm install @openzeppelin/contracts-upgradeable --save
npm install --save-dev @nomiclabs/hardhat-waffle 'ethereum-waffle@^3.0.0' @nomiclabs/hardhat-ethers 'ethers@^5.0.0'
npm install --save-dev @openzeppelin/hardhat-upgrades
