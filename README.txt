Q1. Write a Solidity Smart Contract for a Complete ERC721
Smart Contract where you can perform Minting the NFT
by paying in Ethers, Limiting the supply of NFT’s,
Allowing list functionality, Modifying the Minting
functionality, Withdrawing functionality, and, clean up
code by using internalMint() function.

steps:
1. create a file named Q1.sol
2. import ERC721 contract from openzeppelin
3. name contract as MyNFT and symbol as MNT
4. limited the supply using MAX_SUPPLY
5. added mint() function and marked it as payable
6. implemented internalMint() function
7. implemented withdrawing functionality in withdraw() function
8. implemented allowing list functionality using mapping and only owner callable functions addToAllowList() and removeFromAllowList()