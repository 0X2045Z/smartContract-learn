const {ethers, upgrades} = require("hardhat");

async function main() {

   // 部署可升级的合约
   // init params
   let value = 10;
   const Business = await ethers.getContractFactory("BusinessX2");
   const business = await upgrades.deployProxy(Business, 
                                               [value], 
                                               { 
                                                   initializer: '_Business_init' ,
                                                   unsafeAllowLinkedLibraries: true
                                               });
   await business.deployed();
   console.log("Business deployed to:", business.address);

}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });

// npx hardhat run ./scripts/ganache/deploy_upgradeable_businessX2.js --network ganache
// 0x27b23c2409Fa0b6912A2f2AB3458cD924D7B31D1