# smartContract-learn
# 这个库用来记录我学习智能合约的过程,使用的框架是：hardhat+openzeppelin+ethers.js
# 1.第一次拉取代码，你需要在文件夹内执行：
  1.npm init --yes
  2.npm install --save-dev hardhat
  3.npx hardhat
    ps:Create an empty hardhat.config.js
  4.npm install @openzeppelin/contracts --save
  5.npm install @openzeppelin/contracts-upgradeable --save
  6.npm install --save-dev @nomiclabs/hardhat-waffle 'ethereum-waffle@^3.0.0' @nomiclabs/hardhat-ethers 'ethers@^5.0.0'
# I will use this repositories to document my learning about smart contracts,use:hardhat+openzeppelin+ethers.js
# 1.First pull code,You need execute：
  1.npm init --yes
  2.npm install --save-dev hardhat
  3.npx hardhat
    ps:Create an empty hardhat.config.js
  4.npm install @openzeppelin/contracts --save
  5.npm install @openzeppelin/contracts-upgradeable --save
  6.npm install --save-dev @nomiclabs/hardhat-waffle 'ethereum-waffle@^3.0.0' @nomiclabs/hardhat-ethers 'ethers@^5.0.0'




# Backup
  // --------------------------hardhat.config.js--------------------------------------
  require("@nomiclabs/hardhat-ethers");

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
 module.exports = {
  solidity: "0.8.2",
  networks: {
    ganache: {
      url: `http://localhost:7545`,
      accounts: [`private key`]
    }
  }
};

// npx hardhat run ./scripts/ganache/deploy_erc20.js --network ganache
------------------------------------------------------------------------------------//

