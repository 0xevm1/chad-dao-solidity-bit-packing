import hre, { ethers } from 'hardhat';
import { ChadNFT__factory } from '../typechain';
import {Genome} from "../test/utils/genome";
import {BigNumber} from "ethers";

export async function verify(address: string, args: any[]) {
    try {
        return await hre.run("verify:verify", {
            address: address,
            constructorArguments: args,
        });
    } catch (e) {
        console.log(address, args, e);
    }
}

export async function main() {
  const [deployer] = await ethers.getSigners();

  const chadNFT = await new ChadNFT__factory(deployer).deploy();
  await chadNFT.deployed();
  let receipt = await chadNFT.deployTransaction;
  let gas = await ethers.provider.getTransactionReceipt(receipt.hash);

  console.log(`ChadNFT deployed at ${chadNFT.address} using ${gas.gasUsed} gas`);

}


main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
