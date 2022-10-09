🗿🇹🇩 DAO

Efficient onchain NFT generation using bit packing and data packing to Solidity's logical extremes

Utilizes bitshifting and bitmasking on storage and retrieval to stuff multiple attributes into a single byte. The bitshifting on storage is done in javascript (Typescript) and the full sequence is passed into the smart contract, instead of doing the processing there. On retrieval it is done within the smart contract for simplicity in reading attributes (also called "genomes") onchain without the user needing to decode in their own codebase.

The Typescript example is in the `test` folder.

Includes hardhat-tracer to show the Ethereum Virtual Machine's `SLOAD` and `SSTORE` utilization.

![SSTORE and SLOAD tracer](https://github.com/0xevm1/0xEVM1/blob/main/evm-efficiency-tracer.gif)

Use `npx hardhat test --fulltrace` for that capability.
