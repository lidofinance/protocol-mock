# Lido protocol mock

**This is only a demo/mock code, don't use it in production!**

This repo contains the Lido protocol code with governance, ACL and other important stuff removed. It's not safe and is not intended for production use.


### Staking ETH

To get stETH for testing, do the following:

1. Call `stETH.submit(0)`, sending ETH along with the transaction. This will mint stETH tokens for the tx sender address. Preferrably, send a multiple of 32 ETH (this will help with rebase simulation).
2. Call `stETH.depositBufferedEther()` from any address.


### stETH rebases

The mock stETH/Lido contract contains an deployer-accessible function `stETH.simulateBeaconRewards` which allows to rebase stETH token balances (in mainnet, this happens when Lido oracles report the updated beacon validators number and total balance).

Calling `stETH.simulateBeaconRewards()` without arguments increases balances of all stETH holders by 1%. One can also pass a different multiplier to the single argument of the overloaded version of `simulateBeaconRewards`, `10**18` corresponding to `1.0`. For example:

* To rebase stETH by 3%, call `stETH.simulateBeaconRewards(1030000000000000000)`.
* To simulate penalties and decrease all stETH holders' balances by 1%, call `stETH.simulateBeaconRewards(990000000000000000)`.

### Deployed mocks

### Rinkeby

- Lido: [0xF4242f9d78DB7218Ad72Ee3aE14469DBDE8731eD](https://rinkeby.etherscan.io/address/0xF4242f9d78DB7218Ad72Ee3aE14469DBDE8731eD)
- WstETH: [0xb770Ea0F1762D73c8719B52eF981f7F1D824d9a7](https://rinkeby.etherscan.io/address/0xb770Ea0F1762D73c8719B52eF981f7F1D824d9a7)
- DepositContractMock: [0xd1aC373a6fCAB20476957B14a18178615594Debe](https://rinkeby.etherscan.io/address/0xd1ac373a6fcab20476957b14a18178615594debe)
- NodeOperatorsRegistry: [0x776dFe7Ec5D74526Aa65898B7d77FCfdf15ffBe6](https://rinkeby.etherscan.io/address/0x776dfe7ec5d74526aa65898b7d77fcfdf15ffbe6)

### Goerli

- Lido: [0x2DD6530F136D2B56330792D46aF959D9EA62E276](https://goerli.etherscan.io/address/0x2DD6530F136D2B56330792D46aF959D9EA62E276)
- WstETH: [0x4942BBAf745f235e525BAff49D31450810EDed5b](https://goerli.etherscan.io/address/0x4942BBAf745f235e525BAff49D31450810EDed5b)
- DepositContractMock: [0x924B2BB40AfEf29e908bbCaAaE0DBe957d076b4F](https://goerli.etherscan.io/address/0x924B2BB40AfEf29e908bbCaAaE0DBe957d076b4F)
- NodeOperatorsRegistry: [0x993a1A1745ea09fAbf8dA7EFCD57CD46c889f8B9](https://goerli.etherscan.io/address/0x993a1A1745ea09fAbf8dA7EFCD57CD46c889f8B9)
