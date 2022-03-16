# smartContract-learn
# 这个库用来记录我学习智能合约的过程,使用的框架是：hardhat+openzeppelin+ethers.js
第一次拉取代码，你需要在文件夹内执行：‘sh init.sh’并选择 ‘Create an empty hardhat.config.js’
# I will use this repositories to document my learning about smart contracts,use:hardhat+openzeppelin+ethers.js
First time when you cloned this project.You should execute’sh init.sh’,and chose ‘Create an empty hardhat.config.js’.

# Backup
  // --------------------------hardhat.config.js--------------------------------------
  require("@nomiclabs/hardhat-ethers");
require('@openzeppelin/hardhat-upgrades');
require('@nomiclabs/hardhat-waffle');

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
require("@nomiclabs/hardhat-ethers");
require('@openzeppelin/hardhat-upgrades');
require('@nomiclabs/hardhat-waffle');
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
------------------------------------------------------------------------------------//