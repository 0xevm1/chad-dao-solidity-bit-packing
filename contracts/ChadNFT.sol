// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/*
CHAD NFT Onchain PFP collection       00000000000000000000Okxdl:,,;:::,''';:cloddxxkOOOkkkkkkkkkkkkkkOOOOOOOOOOOOOOOOOOOOOOOkkkkkOOkkkkkkkkkkkkkkkkkkk
0xEVM1 - 0xEVM1@gmail.com             KKK00000000000000Odc;,;,,;;,,;:;'......   ....';coxkkkkkkkkkkkkOOOOOOOOOOOOOOOOOOOOOOOOOOOkOOOOkkkkkkkkkkkkkkkkk
                                      KKKK0000000000Okd;'',,::,:odc;;:c:'.,,,.         ..;lxkkkkkkkkkOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOkkkkkkkkkkkkkkk
KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK000000Odlll:'',,::;::cdxl;,;,......  .... .     .:dkkkkkkkOOkOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOkkkkkkkkkkkkkk
XXXXXXXXXXXXXKKKXKKKKKKKKKKKKKKKKKKKKKKKKKKK000Oo;'...'',;,,;;:lcoddocc:,......        .. ...;dkOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOkkkkkkkkkkkkkk
XXXXXXXXXXXXXXXXXXXXKKKKKKKKKKKKKKKKKKKKKKKKKKOl;:lc;'..';::cclodxxkOOOkxxdddolc:;,'.',;,.';cccxOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOkkkkkkkkkkkkk
XXXXXXXXXXXXXXXXXXXXXKKKKKKKKKKKKKKKKKKKKKKKKOl::::cc:;,,;;:cldxO00KKKK00O0OOOkkkxxxxxxxxxxOOOocdkOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOkkkkkkkkkkk
XXXXXXXXXXXXXXXXXXXXXXXXXXXKKKKKKKKKKKKKKKKKO:....';;,'....';lxOKKKXXXKKK00OOOOkkkkxxxxkkO0KXXKxcokOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOkkkkkkkkkk
XXXXXXXXXXXXXXXXXXXXXXXXXXXXKKKKKKKKKKKKKKKKo..'',:clcc:'.,;lxkOKKKXXXXXKK00OOOkkkkxxxxxkO0KKXNXkldOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOkkkkkkkkk
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKKKKKKKKKKKKK0c''',;;;;;,;;;:oxkOO0KXXXKKKKK000kkxxxxxdddxxkO00KXNN0dxOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOkkkkkkkkkkk
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKKKKKKKKKx:,,;;,',,;:clooxkkOO0XXXXKKKK000OOkkkxxxxdxxkOOO00XNNWOdkOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOkkkkkkkk
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKKKKKKK0l,'''..',:cloodxxk0KXXXXXKKKK0OkxxdoddxxxxxxxO00OOOKNNWXkkOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOkkkkkk
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKKXO:.....',;:llloxO0XXNXXXXKK0Oxoc::;'.'',;:clodOO00xxKXXWW0kOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOkkkkkk
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKKKXO;    .;cc::codOKNNNXXKXK0Oxdollcc:;,'.    .';lodxdkKKXWWXOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOkkkkkkkkk
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKX0;.. .,:ccccldkKNNNXXKXKK0OOOkxoc:::;;'.   ...':cldOkxOKNN0OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOkOOkkkkk
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKo:olcoollc:cx0XNNXXKKKKKOkxo:,,'...       ,ooodoxOd,.,:ldkkkOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOkkkkk
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKxd0NX00OxolokKXXNXXXXKK0Oxdoloooll;'.     'x0KKO00c.   ..:ldkOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOkkkkkk
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXkdOXXXNNNKxxk0KXNNXXXKK000Okxdoc::;,'..    :kKXXO0x'   .'cxkkkOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOkkkkkk
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKxkKKKKXNNKxxkOKXXXXXXXXXKKK0Okxdlc:,'....,lxOKXK0kOc.  ...:O0OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOkkkkkk
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKkxxddxOXXKdclx0KXKKKXXXXXXKK00kxddol:;;;:ok0KXXXKOOk, .lo;lkOOOOOOOOOO00000OOOOOOOOOOOOOOOOOOOOOOOOOOOkkkkkk
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx:;lkKNNXXk:;lk0KKKKKKKKKKKK0Okxdoolcc:::okKXNNXXKOOx:,lOKK000O000000000000000OOO000OOOOOOOOOOOOOOOOOOOkkkkk
NNNNNNNNNNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX0o:o0XNNNXklcldk0KKKKKKKK0OOkkxxddol;''':d0KKKKKXK0OO0kdk0XK0000000000000000000000000OOOOOOOOOOOOOOOOOOkkkkk
NNNNNNNNNNNNNNNNXXXXXXXXXXXXXXXXXXXXXXXXXXK000KO0XNKdlooodkOOO0000OxxkOOkkdoc'..;coxKXOxxOKX0kkKX00XWNKO000000000000000000000000OOOOOOOOOOOOOOOOOkkkkk
NNNNNNNNNNNNNNNNNNNNXXXXXXXXXXXXXXXXXXXXXXXXKXXKKXXOlcoddoodxxxoddccx0K0d:..  .,:cllloocldxOOxxOxdKNMWK0000000000000000000000000OOOOOOOOOOOOOOOOkkkkkk
NNNNNNNNNNNNNNNNNNNNNXXXXXXXXXXXXXXXXXXXXXXXXKKXXK0xlcodxxooolcc:,.;kKO:.     ..'......';::xOkxc.;kNMNK00000000000000000000000000OOOOOOOOOOOOOOOOkkkkk
NNNNNNNNNNNNNNNNNNNNNNNXXXXXXXXXXXXXXXXXXXXXXKKNNXkollodxxdol:;,'..;x0o.    .,,;:;,,'..';..lkxxd,:0WNK000000000000000000000000000OOOOOOOOOOOOOOOOOkkkk
NNNNNNNNNNNNNNNNNNNNNNNNNNNNNXXXXXXXXXXXXXXXXKKNWKdoxdodddoolc;'.  .cdo.    .,lxkkxxdoool;;okkddcoKWK00000000000000000000000000000OOOOOOOOOOOOOOOOkkkk
NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNXXXXXXXXXXXXXXXKXNOdxxdxdolc:cc;.    ,lo,    .,cdk0O00OOkdoxk0K0dlx0K0000000000000000000000000000000OOOOOOOOOOOOOOOOkkk
NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNXXXXXXXXXXXXXXXXXkodxxkkdl:;,,'.    ':c,    .cdddxxkO0KK0KNKo:c;;dxxO00000000000000000000000000000000OOOOOOOOOOOOOkkkk
NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNXXXXXXXXXXXXXNXxoddxkkdo:,.....   .,:.     .;odxxkkxxxk0KX0o. 'lok000000000000000000000000000000000OOOOOOOOOOOOOOkkk
NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNXXXXXXXXXXXXXNXxllodxxdl:,'....   .,;.      ..,;clolclok0XWNx,c:lO0000000000000000000000000000000000OOOOOOOOOOOOOOkk
NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNXXXXXXXXXXNNOl::ccllc;;,'..    .,;.         ..... ..:dkOOdllcd00000000000000000000000000000000000OOOOOOOOOOOOOOOk
NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNXXXXXXXXXNNXOl;,;;::,,,...    .,;'.        . ... ..;dOkxooddO000000000000000000000000000000000000OOOOOOOOOOOOOOk
NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNXXXXXXXXNNNNNKko:'........    .;:,..     .     ...,lxOkdldO0000000000000000000000000000000000000000OOOOOOOOOOOOO
NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNXXXXXXXNNNNNNNX0ko:.. ....    ':;,'...         ...;oolccxKK000000000000000000000000000000000000000OOOOOOOOOOOOO
NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNXXXXXXNNNNNNNNXXXKkdc,.      ':::;'....        ...,;;:lkKK000000000000000000000000000000000000000OOOOOOOOOOOOO
NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNXXXXXNNNNNNNNXXXXXKKK0xc,.   .';:ccc::;'...     ..,;:ldOKX000000000000000000000000000000000000000OOOOOOOOOOOOO
NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNXXKXXNNNNNNNNXXKKKKKKK00Od:.  ..,:cccc:;''..... ..,clxk0KK0000000000000000000000000000000000000000OOOOOOOOOOOO
NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNXXKKXNNNNNNNNXXKKKKKKK00000Od,.  ...'''.''......  .,:coxO0K000000000000000000000000000000000000000000OOOOOOOOOO
NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNXXK0KXNNNNWNNNXXXXXKKKK0000KK00Od:.     ....... ... .';ldk0K0000000000000000000000000000000000000000000OOOOOOOOOO
NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNXXXXKK000KXXNNNNNNNXXXXXKKKKKKKKKKKKK00Oxc,.....         ...,cxO0000000000000000000000000000000000000000000000OOOOOOOOO
NNNNNNNNNNNNNNNNNNNNNNNNNNNXXKKK000OO000KXNNNNNNNXXXXXXKKKKKKKKKKKKK00Oxocccc:;;;,'..   ..,:x0000000000000000000000000000000000000000000000000OOOOOOOO
*/

import "erc721a/contracts/ERC721A.sol";

contract ChadNFT {//is ERC721A {

    uint256 private constant MAX_PFP = 5000;

    mapping(uint256 => bytes) private byteGenomes;

    constructor() {}//ERC721A("ChadNFT", "CHAD") {}

    //event GenomeWatch(uint8 value);

    function binaryLeftShift(bytes1 a, uint8 n) internal pure returns (bytes1) {
        return a << n;
    }

    function binaryRightShift(bytes1 a, uint8 n) internal pure returns (bytes1){
        return a >> n;
    }

    function getLastN(bytes1 x, uint8 n) internal pure returns (bytes1) {
        uint8 y = uint8(x);

        uint256 mask = (1 << n) - 1;

        uint8 z = y & uint8(mask);

        return bytes1(z);
    }

    function setGenome(uint8 id, bytes memory attributes) external {

        byteGenomes[id] = attributes;

    }

    function getGenome(uint256 id)
        external
        view
        returns (uint8[] memory)
    {

        //then do bitshifting to get their 12 real values back and return those

        //there are only 4 values in the map, 0: 0 - 1249, 1: 1250 - 2499, 2: 2500 - 3749, 3: 3750 - 4999

        uint256 indexer = id;
        uint256 split = 1250; //1,250 elements were stored at each key of the map
        bytes memory tempRead;
        if(id < split)
            tempRead = byteGenomes[0];
        else if (id < (split * 2)){
            tempRead = byteGenomes[1];
            id = id - split;
            //id = split - ((split * 2) % id);
        }else if (id < (split * 3)){ //3,750
            tempRead = byteGenomes[2];
            id = split - ((split * 3) % id);
        } else if (id < (split * 4)){ //5,000
            tempRead = byteGenomes[3];
            id = split - ((split * 4) % id);
        } else
            return new uint8[](0); //new bytes1[](0);

        /* new mapping
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

        // return to desired original mapping
        // - **BackgroundColor** : 0 -> 30
        // - **BackgroundPattern** : 0 -> 5
        // - **Wings** : 0 -> 10
        // - **Skin** : 0 -> 30
        // - **SkinPattern** : 0 -> 10
        // - **Paint** : 0 -> 10
        // - **Body** : 0 -> 100
        // - **Mouth** : 0 -> 50
        // - **Eyes** : 0 -> 60
        // - **Hat** : 0 -> 100
        // - **Pet** : 0 -> 5
        // - **Hands** : 0 -> 10

        indexer = id * 8;

        bytes1[] memory genomes = new bytes1[](12);
        genomes[0] = binaryRightShift(tempRead[indexer + 0], 3);  //assign to backgroundColor
        genomes[1] = getLastN(tempRead[indexer + 0], 3);  //BackgroundPattern
        genomes[2] = binaryRightShift(tempRead[indexer + 1], 4);  //Wings
        genomes[3] = binaryRightShift(tempRead[indexer + 2], 3);  //Skin
        genomes[4] = getLastN(tempRead[indexer + 1], 4);  //SkinPattern
        genomes[5] = binaryRightShift(tempRead[indexer + 3], 4);  //Paint
        genomes[6] = tempRead[indexer + 4];  //Body
        genomes[7] = tempRead[indexer + 5];  //Mouth
        genomes[8] = tempRead[indexer + 6]; //Eyes
        genomes[9] = tempRead[indexer + 7];  //Hat
        genomes[10] =  getLastN(tempRead[indexer + 2], 3); //Pet
        genomes[11] =  getLastN(tempRead[indexer + 3], 4); //Hands

        uint8[] memory genomeInt = new uint8[](12);
        genomeInt[0] = uint8(genomes[0]);
        genomeInt[1] = uint8(genomes[1]);
        genomeInt[2] = uint8(genomes[2]);
        genomeInt[3] = uint8(genomes[3]);
        genomeInt[4] = uint8(genomes[4]);
        genomeInt[5] = uint8(genomes[5]);
        genomeInt[6] = uint8(genomes[6]);
        genomeInt[7] = uint8(genomes[7]);
        genomeInt[8] = uint8(genomes[8]);
        genomeInt[9] = uint8(genomes[9]);
        genomeInt[10] = uint8(genomes[10]);
        genomeInt[11] = uint8(genomes[11]);

        return genomeInt;

        //the slot number is an index which contains 4 genomes, with 5000 genomes there will be 1249 indexes starting at 0
    }

}
