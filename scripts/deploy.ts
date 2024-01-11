import { ethers } from "hardhat";

async function main() {
  const MultisigFactory = await ethers.getContractFactory("MultisigFactory");
  const factory = await MultisigFactory.deploy();

  await factory.waitForDeployment();

  console.log(
    `Multisig Factory deployed to ${factory.target}`
  );
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
