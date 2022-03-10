const { expect } = require("chai");
const {ethers} = require("hardhat");

async function main() {
    const [deployer] = await ethers.getSigners();
    const admin = deployer;
    console.log("admin:", admin.address);

    /**
     * TTA 0x929d97cC40EdB4C7b16F745410819F8285Ed4Ad8
     * TTB 0x63be2D85a0ab6377d512Ec3A427c4Eb0D3e604a2
     * TTC 0x9ce95B4aA2BFaED3561bAEd0EDb33d931786587a
     * TTD 0x0731150D688f6Ff1403ed82d09D1d13747Ee3CD0
     */

    // 连接合约
    let tokenAddr = "0x0731150D688f6Ff1403ed82d09D1d13747Ee3CD0";
    const TOKENABI = await ethers.getContractFactory("ERC20FixedSupply");
    const TOKEN = await TOKENABI.attach(tokenAddr);
    console.log("Token address: ", TOKEN.address);

    // 用例
    // totalSupply = (10**8)*(10**18);
    let amount = ethers.utils.parseEther("2000");
    const totalSupply = "100000000000000000000000000";
    const owner = admin.address;
    const addrTo = "0xfDAb356621ad45553a662726C43EA961b90f04aD";
    // 检查发行总量与Token合约余额是否一致
    const totalSupplyGet = await TOKEN.totalSupply();
    expect(totalSupplyGet).to.equal(totalSupply);
    // 测试余额
    const ownerBalance = await TOKEN.balanceOf(owner);
    console.log("发行者账户余额: " + ownerBalance);
    // 测试发送
    expect(await TOKEN.transfer(addrTo, amount));
    // 获取接收者余额
    const addrToBalance = await TOKEN.balanceOf(addrTo);
    console.log("测试接收者账户余额: " + addrToBalance);
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });

// npx hardhat run ./test/ERC20/ERC20FixedSupplyTest.js --network ganache