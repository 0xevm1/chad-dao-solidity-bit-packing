import { BigNumber } from 'ethers';

export interface Genome {
  bgColor: BigNumber;
  bgPattern: BigNumber;
  wings: BigNumber;
  skin: BigNumber;
  skinPattern: BigNumber;
  paint: BigNumber;
  body: BigNumber;
  mouth: BigNumber;
  eyes: BigNumber;
  hat: BigNumber;
  pet: BigNumber;
  hands: BigNumber;
}

export function arrayToGenome(
  attr: [
    number,
    number,
    number,
    number,
    number,
    number,
    number,
    number,
    number,
    number,
    number,
    number,
  ],
): Genome {
  return {
    bgColor: BigNumber.from(attr[0]),
    bgPattern: BigNumber.from(attr[1]),
    wings: BigNumber.from(attr[2]),
    skin: BigNumber.from(attr[3]),
    skinPattern: BigNumber.from(attr[4]),
    paint: BigNumber.from(attr[5]),
    body: BigNumber.from(attr[6]),
    mouth: BigNumber.from(attr[7]),
    eyes: BigNumber.from(attr[8]),
    hat: BigNumber.from(attr[9]),
    pet: BigNumber.from(attr[10]),
    hands: BigNumber.from(attr[11]),
  };
}

export function genomeToArray(genome: Genome) {
  return [
    genome.bgColor,
    genome.bgPattern,
    genome.wings,
    genome.skin,
    genome.skinPattern,
    genome.paint,
    genome.body,
    genome.mouth,
    genome.eyes,
    genome.hat,
    genome.pet,
    genome.hands,
  ];
}
