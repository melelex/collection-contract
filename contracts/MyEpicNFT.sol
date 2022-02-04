//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";


contract MyEpicNFT is ERC721URIStorage{
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    string baseSvg = "<svg xmlns='http://www.w3.org/2000/svg' preserveAspectRatio='xMinYMin meet' viewBox='0 0 350 350'><style>.base { fill: white; font-family: serif; font-size: 24px; }</style><rect width='100%' height='100%' fill='black' /><text x='50%' y='50%' class='base' dominant-baseline='middle' text-anchor='middle'>";
    
    string[] firstWords = ["Fantastic", "Epic", "Crazy", "Wild", "Terrifying", "Wild"];
    string[] secondWords = ["Hamburger", "Coffe", "Tea", "Pizza", "Ham", "ChickenWings"];
    string[] thirdWords = ["HANGE", "ZEKE", "KRUGER", "LEVI", "ARMIN", "MIKASA", "EREN"];

    constructor() ERC721('The Imps', 'Imp') {
        console.log('my nft contract test !!!!');
    }

    function random(string memory input) internal pure returns(uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }

    function pickRandomFirstWord(uint256 tokenId) public view returns(string memory) {
        uint256 rand = random(string(abi.encodePacked("FIRST_WORD", Strings.toString(tokenId))));

        rand = rand % firstWords.length;

        return firstWords[rand];
    }

    function pickRandomSecondWord(uint256 tokenId) public view returns(string memory) {
        uint256 rand = random(string(abi.encodePacked("FIRST_WORD", Strings.toString(tokenId))));

        rand = rand % secondWords.length;

        return secondWords[rand];
    }

    function pickRandomThirdWord(uint256 tokenId) public view returns(string memory) {
        uint256 rand = random(string(abi.encodePacked("FIRST_WORD", Strings.toString(tokenId))));

        rand = rand % thirdWords.length;

        return thirdWords[rand];
    }

    // mint numerable nft

    function makeNFT() public {
        uint256 newItemId = _tokenIds.current();

        string memory first = pickRandomFirstWord(newItemId);
        string memory second = pickRandomSecondWord(newItemId);
        string memory third = pickRandomThirdWord(newItemId);

        string memory finalSvg = string(abi.encodePacked(baseSvg, first, second, third, "</text></svg>"));
        console.log("\n------------------------------");
        console.log(finalSvg);
        console.log("\n------------------------------");

        _safeMint(msg.sender, newItemId);

        _setTokenURI(newItemId, "bla bla");

        //increment the counter for when the next is minted
        _tokenIds.increment();
        console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);

    }


}