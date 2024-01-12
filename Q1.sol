// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721, ERC721Enumerable, Ownable {
    uint8 MAX_SUPPLY = 1;
    uint8 mint_count;

    mapping (address => bool) allow_list;

    constructor(address initialOwner)
        ERC721("MyNFT", "MNT")
        Ownable(initialOwner)
    {}

    function addToAllowList(address _address) external onlyOwner {
        allow_list[_address] = true;
    }

    function removeFromAllowList(address _address) external onlyOwner {
        allow_list[_address] = false;
    }

    function safeMint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId);
    }

    function _update(address to, uint256 tokenId, address auth)
        internal
        override(ERC721, ERC721Enumerable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }

    function _increaseBalance(address account, uint128 value)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._increaseBalance(account, value);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    function withdraw() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    function mint() external payable {
        internalMint();
    } 

    function internalMint() internal {
        require(msg.sender != address(0), "Invalid address");
        require(mint_count < MAX_SUPPLY, "Max supply reached");

        if (allow_list[msg.sender] == true) {
            uint8 tokenId = totalSupply() + 1;
            _safeMint(msg.sender, tokenId);
            mint_count++;
        }
    }
}