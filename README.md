# Use Onchain Metadata With Your NFTs

talk a bout onchain nft

## Getting Started

Create a project using this example:
run: `npx thirdweb@latest create --contract`

- What is your project named? … nft-onchain
- What framework do you want to use? › Hardhat
- What will be the name of your new smart contract? … MyContract
- What type of contract do you want to start from? › ERC721
- What extensions do you want to add to your contract? › None

You can start editing the page by modifying `contracts/Contract.sol`.

To add functionality to your contracts, you can use the `@thirdweb-dev/contracts` package which provides base contracts and extensions to inherit. The package is already installed with this project. Head to our [Contracts Extensions Docs](https://portal.thirdweb.com/contractkit) to learn more.

## Install dependency

watch `package.json` file
run `yarn add @openzeppelin/contracts` or `npm install @openzeppelin/contracts`
edit `MyContract.sol` file

## Deploy smart contract

run `npx thirdweb@latest deploy`

## Building the project

After any changes to the contract, run:

```bash
npm run build
# or
yarn build
```

to compile your contracts. This will also detect the [Contracts Extensions Docs](https://portal.thirdweb.com/contractkit) detected on your contract.

## Deploying Contracts

When you're ready to deploy your contracts, just run one of the following command to deploy you're contracts:

```bash
npm run deploy
# or
yarn deploy
```

## Releasing Contracts

If you want to release a version of your contracts publicly, you can use one of the followings command:

```bash
npm run release
# or
yarn release
```
