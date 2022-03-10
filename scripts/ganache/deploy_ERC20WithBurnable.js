const {ethers} = require("hardhat");

async function main() {

    const [deployer] = await ethers.getSigners();

    console.log(
        "Deploying contracts with the account:",
        await deployer.getAddress()
    );

    let amount = 10**8;
    const Token = await ethers.getContractFactory("ERC20WithBurnable");
    const token = await Token.deploy('testB','BBA',amount);
    await token.deployed();

    console.log("Token address:", token.address);
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });

// npx hardhat run ./scripts/ganache/deploy_ERC20WithBurnable.js --network ganache
// address  
// BBA 0xB0eF2a3Df652eEB27DC4345Ba182f46519B2f00F