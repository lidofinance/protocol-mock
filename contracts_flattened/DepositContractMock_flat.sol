// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.4.24;



// Part: IDepositContract

/**
  * @title Deposit contract interface
  */
interface IDepositContract {
        /**
      * @notice Top-ups deposit of a validator on the ETH 2.0 side
      * @param pubkey Validator signing key
      * @param withdrawal_credentials Credentials that allows to withdraw funds
      * @param signature Signature of the request
      * @param deposit_data_root The deposits Merkle tree node, used as a checksum
      */
    function deposit(
            bytes /* 48 */ pubkey,
        bytes /* 32 */ withdrawal_credentials,
        bytes /* 96 */ signature,
        bytes32 deposit_data_root
    )
        external payable;
}

// File: DepositContractMock.sol

contract DepositContractMock is IDepositContract {
    event Deposit(
        bytes pubkey,
        bytes withdrawal_credentials,
        bytes signature,
        bytes32 deposit_data_root,
        uint256 value
    );

    event EtherClaimed(
        address indexed claimer,
        uint256 amount
    );

    function deposit(
        bytes /* 48 */ pubkey,
        bytes /* 32 */ withdrawal_credentials,
        bytes /* 96 */ signature,
        bytes32 deposit_data_root
    )
        external
        payable
    {
        emit Deposit(pubkey, withdrawal_credentials, signature, deposit_data_root, msg.value);
    }

    function claim() external {
        uint256 balanceToClaim = address(this).balance;
        msg.sender.send(balanceToClaim);
        emit EtherClaimed(msg.sender, balanceToClaim);
    }
}
