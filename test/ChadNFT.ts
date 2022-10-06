import { expect } from 'chai';
import { ChadNFT, ChadNFT__factory } from '../typechain';
import { ethers } from 'hardhat';
import { BigNumber } from 'ethers';
import { SignerWithAddress } from '@nomiclabs/hardhat-ethers/dist/src/signer-with-address';
import { Genome, genomeToArray } from './utils/genome';

let deployer: SignerWithAddress;
let chadNFT: ChadNFT;

describe('ChadNFT', () => {
  let snapshotId: number;

  before(async () => {
    [deployer] = await ethers.getSigners();

    chadNFT = await new ChadNFT__factory(deployer).deploy();
  });

  beforeEach(async () => {
    snapshotId = await ethers.provider.send('evm_snapshot', []);
  });

  afterEach(async () => {
    await ethers.provider.send('evm_revert', [snapshotId]);
  });

  it('should efficiently save genomes on chain', async () => {

    function singleDecimalToBinary(a: BigNumber): BigNumber {

      //get binary representation of random number
      let binary_a = a.toNumber().toString(2);

      return BigNumber.from(parseInt(binary_a, 2));
    }

    function doubleDecimalToBinary(a: BigNumber, b: BigNumber, offset_a: number): BigNumber {
      let binaryPrimer = '00000000';

      //get binary representation of random number
      let binary_a = a.toNumber().toString(2);

      let binary_b = b.toNumber().toString(2);

      //pad binary representation with leading zeros
      binary_b = binaryPrimer.substring(0, binaryPrimer.length - binary_b.length) + binary_b;

      //cut it down to size
      binary_b = binary_b.substring(offset_a, binary_b.length);

      //combine binary numbers to fit in a single byte && convert back into decimal number
      let binary_c = binary_a + binary_b;

      return BigNumber.from(parseInt(binary_c, 2));
    }

    const TEST_LIMIT = 4;

    const rand = (max: number) => {
      return Math.round(Math.random() * max);
    };

    const inputGenomes: Genome[] = [];
    let testGenomes: Genome[] = [];
    for (let i = 0; i < 5000; i++) {
      const genome: Genome = {
        bgColor: BigNumber.from(rand(30)),
        bgPattern: BigNumber.from(rand(5)),
        wings: BigNumber.from(rand(10)),
        skin: BigNumber.from(rand(30)),
        skinPattern: BigNumber.from(rand(10)),
        paint: BigNumber.from(rand(10)),
        body: BigNumber.from(rand(100)),
        mouth: BigNumber.from(rand(50)),
        eyes: BigNumber.from(rand(60)),
        hat: BigNumber.from(rand(100)),
        pet: BigNumber.from(rand(5)),
        hands: BigNumber.from(rand(10)),
      };

      inputGenomes.push(genome);
      //testGenomes.push(genome);
    }

    let decimalArray = [];
    let preHexArray = [];
    let postHexArray = [];

    for(let i = 0; i < TEST_LIMIT; i++){

      let data = `0x`;
      let abiCoder = new ethers.utils.AbiCoder();
      for(let j = 0; j < 1250; j++){ //4 is the max number of complete genomes we are storing

        let indexer = 0;
        switch(i){
          case 0:
            indexer = 0;
            break;
          case 1:
            indexer = 1250;
          case 2:
            indexer = 2500;
            break;
          case 3:
            indexer = 3750;
            break;
        }
        let values = inputGenomes.at(indexer + j);

        //additional arrays for command line comparison
        testGenomes.push(inputGenomes.at(indexer+j));

        decimalArray.push([values?.bgColor, values?.bgPattern, values?.wings, values?.skin, values?.skinPattern,
          values?.paint, values?.body, values?.mouth, values?.eyes, values?.hat, values?.pet, values?.hands]);
        preHexArray.push([ethers.utils.hexlify(values.bgColor), ethers.utils.hexlify(values.bgPattern),
          ethers.utils.hexlify(values.wings), ethers.utils.hexlify(values.skin), ethers.utils.hexlify(values.skinPattern),
          ethers.utils.hexlify(values.paint), ethers.utils.hexlify(values.body), ethers.utils.hexlify(values.mouth),
          ethers.utils.hexlify(values.eyes), ethers.utils.hexlify(values.hat), ethers.utils.hexlify(values.pet),
          ethers.utils.hexlify(values.hands)]);

        /*
        - **BackgroundColor** : 0 -> 30 [11110] 5 bits, 3 unused
        - **BackgroundPattern** : 0 -> 5 [101] 3 bits, 5 unused

        - **Wings** : 0 -> 10 [1010] 4 bits, 4 unused
        - **SkinPattern** : 0 -> 10 [1010] 4 bits, 4 unused

        - **Skin** : 0 -> 30 [11110] 5 bits, 3 unused
        - **Pet** : 0 -> 5 [101] 3 bits, 5 unused

        - **Paint** : 0 -> 10 [1010] 4 bits, 4 unused
        - **Hands** : 0 -> 10 [1010] 4 bits, 4 unused

        - **Body** : 0 -> 100 [1100100] 7 bits, 1 unused

        - **Mouth** : 0 -> 50 [110010] 6 bits, 2 unused

        - **Eyes** : 0 -> 60 [111100] 6 bits, 2 unused

        - **Hat** : 0 -> 100 [1100100] 7 bits, 1 unused */

        let byte1 = doubleDecimalToBinary(values?.bgColor, values?.bgPattern, 5);
        let byte2 = doubleDecimalToBinary(values?.wings, values?.skinPattern, 4);
        let byte3 = doubleDecimalToBinary(values?.skin, values?.pet, 5);
        let byte4 = doubleDecimalToBinary(values?.paint, values?.hands, 4);
        let byte5 = singleDecimalToBinary(values?.body);
        let byte6 = singleDecimalToBinary(values?.mouth);
        let byte7 = singleDecimalToBinary(values?.eyes);
        let byte8 = singleDecimalToBinary(values?.hat);

        let hexValues = ethers.utils.hexConcat([byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8]).substring(2);
        postHexArray.push(hexValues);
        data = data + hexValues;
      }


      //console.log(`Pre-encoded ${data}`);

      let receipt = await chadNFT.setGenome(i, data);

      let logs = await ethers.provider.getTransactionReceipt(receipt.hash);
      console.log(`Gas used: ${logs.gasUsed}`);
    }

    for (let i = 0; i < 5000; i++) {
      const r = await chadNFT.getGenome(i);
      let results = new Array();
      results.push(BigNumber.from(r.at(0)));
      results.push(BigNumber.from(r.at(1)));
      results.push(BigNumber.from(r.at(2)));
      results.push(BigNumber.from(r.at(3)));
      results.push(BigNumber.from(r.at(4)));
      results.push(BigNumber.from(r.at(5)));
      results.push(BigNumber.from(r.at(6)));
      results.push(BigNumber.from(r.at(7)));
      results.push(BigNumber.from(r.at(8)));
      results.push(BigNumber.from(r.at(9)));
      results.push(BigNumber.from(r.at(10)));
      results.push(BigNumber.from(r.at(11)));
      let currentGenome = testGenomes.at(i);
      expect(results).to.deep.eq(genomeToArray(currentGenome));
    }
  });

});
