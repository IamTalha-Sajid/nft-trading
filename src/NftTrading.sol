// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract NftTrading is Ownable {
    constructor(address initialOwner) Ownable(initialOwner) {}
}