const {ethers, upgrades} = require("hardhat");

async function main() {

   // 部署可升级的合约
   // init params
//    let value = 10;
//    const Business = await ethers.getContractFactory("Business");
//    const business = await upgrades.deployProxy(Business, 
//                                                [value], 
//                                                { 
//                                                    initializer: '_Business_init' ,
//                                                    unsafeAllowLinkedLibraries: true
//                                                });
//    await business.deployed();
//    console.log("Business deployed to:", business.address);

   // 查看ProxyAdmin合约地址，第一次部署时，该地址保存路径为：.openzeppelin/unknown-1337.json admin{address}
//    console.log("Get ProxyAdmin...");
//    const ProxyAdminAddr = await upgrades.admin.getInstance();
//    console.log("ProxyAdmin address : " + ProxyAdminAddr.address);

   // 转移ProxyAdmin管理员,这里调用的是Ownable合约的transferOwnership()函数
   // ps：ProxyAdmin合约的changeProxyAdmin()函数可以修改代理合约TransparentUpgradeableProxy的_admin参数(ProxyAdmin的地址)
//    let adminTo = "0xfDAb356621ad45553a662726C43EA961b90f04aD";
//    await upgrades.admin.transferProxyAdminOwnership(adminTo);
//    console.log("Transferred ownership of ProxyAdmin to: ", adminTo);

   // 升级合约，代理合约地址保存路径为：.openzeppelin/unknown-1337.json proxies{address}
   // V2
   const BusinessV2 = await ethers.getContractFactory("BusinessV2");
   console.log("Upgrading Box...");
   const businessV2 = await upgrades.upgradeProxy("0x59e59Fdb7762741762Fe17774862C5cB0D877E78", BusinessV2);
   console.log("Box upgraded");
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });

// npx hardhat run ./scripts/ganache/deploy_upgradeable_business.js --network ganache
// 0x59e59Fdb7762741762Fe17774862C5cB0D877E78