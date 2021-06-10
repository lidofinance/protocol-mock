# Lido protocol mock

**This is only a demo/mock code, don't use it in production!**

This repo contains the Lido protocol code with governance, ACL and other important stuff removed. It's not safe and is not intended for production use.


### Staking ETH

To get stETH for testing, do the following:

1. Call `stETH.submit(0)`, sending ETH along with the transaction. This will mint stETH tokens for the tx sender address. Preferrably, send a multiple of 32 ETH (this will help with rebase simulation).
2. Call `stETH.depositBufferedEther()` from any address.


### stETH rebases

The mock stETH/Lido contract contains an admin-accessible function `stETH.simulateBeaconRewards` which allows to rebase stETH token balances (in mainnet, this happens when Lido oracles report the updated beacon validators number and total balance).

Calling `stETH.simulateBeaconRewards()` without arguments (step 3) increases balances of all stETH holders by 1%. One can also pass a different multiplier to the single argument of the overloaded version of `simulateBeaconRewards`, `10**18` corresponding to `1.0`. For example:

* To rebase stETH by 3%, call `stETH.simulateBeaconRewards(1030000000000000000)`.
* To simulate penalties and decrease all stETH holders' balances by 1%, call `stETH.simulateBeaconRewards(990000000000000000)`.
