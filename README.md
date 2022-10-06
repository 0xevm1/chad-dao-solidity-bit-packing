🗿🇹🇩 DAO

Efficient onchain NFT generation using bit packing and data packing to Solidity's logical extremes

Utilizes bitshifting and bitmasking on storage and retrieval to stuff multiple attributes into a single byte. The bitshifting on storage is done in javascript and the full sequence is passed into the smart contract, instead of doing the processing there. On retrieval it is done within the smart contract for simplicity in reading attributes (also called "genomes") onchain without the user needing to decode in their own codebase.
