// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

/// @title Contract that will handle NFT Trading
/// @author Talha Sajid (iamtalha.sajid@gmail.com)
/// @dev Escrow for NFTs
contract NftTrading is Ownable {
    IERC721 public NFT_CONTRACT;

    /// @dev Constructor that set initial owner of the contract and nft address
    /// @param _initialOwner the address of the owner of the contract
    /// @param _nftAddress the address of the nft contract whose token ids will be traded
    constructor(
        address _initialOwner,
        address _nftAddress
    ) Ownable(_initialOwner) {
        NFT_CONTRACT = IERC721(_nftAddress);
    }

    /// @dev Event to store all Trades off-chain
    /// @param _owner this is the owner of the nft
    /// @param _tokenId this is the token ID of the nft being open for trade
    /// @param _price this is the price of the nft being open for trade
    event nftIsOnTrading(address _owner, uint256 _tokenId, uint256 _price);

    /// @dev Event to remove all the Trades off-chain
    /// @param _owner this is the owner of the nft
    /// @param _tokenId this is the token ID of the nft being removed for trade
    event nftIsRemovedFromTrading(address _owner, uint256 _tokenId);

    /// @dev This function puts a nft up for trading for other users to buy
    /// @param _tokenId token ID of the nft you wanna put up for trading on the platform
    /// @param _price price of the nft you wanna put up for trading on the platform in BNB (wei)
    /// @return boolean value true if transaction is successful
    function putNftOnTrade(
        uint256 _tokenId,
        uint256 _price
    ) public returns (bool) {
        //! Logic to transfer NFT from USER to this CONTRACT
        emit nftIsOnTrading(msg.sender, _tokenId, _price);
        return true;
    }

    /// @dev This function removes a nft from trading for other users to buy
    /// @param _tokenId token ID of the nft you wanna remove from trading on the platform
    /// @return boolean value true if transaction is successful
    function removeNftFromTrade(uint256 _tokenId) public returns (bool) {
        //! Logic to transfer NFT from USER to this CONTRACT
        emit nftIsRemovedFromTrading(msg.sender, _tokenId);
        return true;
    }
}
