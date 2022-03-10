const {ethers} = require("hardhat");

async function main() {

    const [deployer] = await ethers.getSigners();

    console.log(
        "Deploying contracts with the account:",
        await deployer.getAddress()
    );

    const Token = await ethers.getContractFactory("ERC20FixedSupply");
    const token = await Token.deploy('testD','TTD',10**8);
    await token.deployed();

    console.log("Token address:", token.address);
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });

// npx hardhat run ./scripts/ganache/deploy_ERC20FixedSupply.js --network ganache
// address  
// TTA 0x929d97cC40EdB4C7b16F745410819F8285Ed4Ad8
// TTB 0x63be2D85a0ab6377d512Ec3A427c4Eb0D3e604a2
// TTC 0x9ce95B4aA2BFaED3561bAEd0EDb33d931786587a
// TTD 0x0731150D688f6Ff1403ed82d09D1d13747Ee3CD0