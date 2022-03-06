# smartContract-learn
# 这个库用来记录我学习智能合约的过程,使用的框架是：hardhat+openzeppelin+ethers.js
# 1.第一次拉取代码，你需要在文件夹内执行：
  1.执行 ‘sh init.sh’来下载项目依赖
  2.执行 ‘npx hardhat’，选择 ‘Create an empty hardhat.config.js’
# I will use this repositories to document my learning about smart contracts,use:hardhat+openzeppelin+ethers.js
# 1.First pull code,You need execute：
  1.Initialize project dependencies using 'sh init.sh'
  2.Execute ‘npx hardhat’, and ‘Create an empty hardhat.config.js’

# Backup
  // --------------------------hardhat.config.js--------------------------------------
  require("@nomiclabs/hardhat-ethers");
require('@openzeppelin/hardhat-upgrades');

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
 module.exports = {
  solidity: {
    compilers: [
      { version: "0.8.2", settings: {
          optimizer: {
            enabled: true,
            runs: 200
          }
        } 
      },{ version: "0.5.16", settings: {
          optimizer: {
            enabled: true,
            runs: 200
          }
        }
      }
    ],
  },
  networks: {
    ganache: {
      url: `http://localhost:7545`,
      accounts: [`private key`]
    }
  }
};

// npx hardhat run ./scripts/ganache/deploy_erc20.js --network ganache
------------------------------------------------------------------------------------//