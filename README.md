# MELD Hardhat Template

This project is a template for EVM based MELD Hardhat projects using Typescript. It contains basic configuration and scripts to get you started.

## Installation

Just run `yarn` or `npm install` to get started

## Configuration

The network configuration is in the `hardhat.config.ts` file. You can add or modify networks there. There is a `.sample.env` file that you can use as a template to create a `.env` file with the private keys of the accounts you want to interact with the different networks. You can also configure a different RPC URL for each network, as well as set your own `ETHERSCAN_API_KEY`.

## Utils

In the `package.json` file there are some basic scripts like `clean`, `compile`, `test`, etc. You can run them with `yarn <script>` or `npm run <script>`.

Besides that, there are some VADD utilities (vanity address / deterministic deployment) in the form of tasks (inside `tasks/vadd.ts`). Please refer to the [VADD documentation](VADD.md) for more information.

## Verify contracts

To verify contracts on many explorers, you need to set the appropriate `ETHERSCAN_API_KEY` env var and run the following command:

```
yarn hardhat verify --network <network> <contract address> <constructor arguments>
```

This works for the main explorers of mutiple networks such as Ethereum, Polygon and Avalanche. However, in order to verify contracts in the Avascan explorer for the MELD subnet, instead of setting the `ETHERSCAN_API_KEY` env var. You'll need to set the `VERIFY_MELD_AVASCAN` env var to `true` and run the same command as before (no API key needed).
