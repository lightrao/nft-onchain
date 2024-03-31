// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC721Base} from "@thirdweb-dev/contracts/base/ERC721Base.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MyContract is ERC721Base {
    constructor(
        address _defaultAdmin,
        string memory _name,
        string memory _symbol,
        address _royaltyRecipient,
        uint128 _royaltyBps
    )
        ERC721Base(
            _defaultAdmin,
            _name,
            _symbol,
            _royaltyRecipient,
            _royaltyBps
        )
    {}

    // create 3 string arrays - blockchains, dapps, tokens
    string[] public blockchains = [
        "Ethereum",
        "Solana",
        "Arbitrum",
        "Fantom",
        "Polygon",
        "Bitcoin"
    ];
    string[] public dapps = [
        "Aave",
        "Orca",
        "Uniswap",
        "MakerDAO",
        "Magic Eden"
    ];
    string[] public tokens = ["$ETH", "$SOL", "$BTC", "$AVAX"];

    // random function - generate a random number
    function random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }

    // pluck function - pluck a random item from the array
    function pluck(
        uint256 tokenId,
        string memory keyPrefix,
        string[] memory sourceArray
    ) internal view returns (string memory) {
        uint256 rand = random(
            string(abi.encodePacked(keyPrefix, Strings.toString(tokenId)))
        );
        string memory output = sourceArray[rand % sourceArray.length];
        return output;
    }

    // function tokenURI - get the state of Nft, build an SVG image with random word then include it into Nft metadata
    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        string[8] memory parts;

        parts[
            0
        ] = '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350"><style>.base { fill: white; font-family: serif; font-size: 14px; }</style><rect width="100%" height="100%" fill="black" /><text x="10" y="20" class="base">';
        parts[1] = getName(tokenId);
        parts[2] = '</text><text x="10" y="40" class="base">';
        parts[3] = getLocation(tokenId);
        parts[4] = '</text><text x="10" y="60" class="base">';
        parts[6] = getIndustry(tokenId);
        parts[7] = "</text></svg>";

        string memory output = string(
            abi.encodePacked(
                parts[0],
                parts[1],
                parts[2],
                parts[3],
                parts[5],
                parts[6],
                parts[7]
            )
        );

        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "Web3 Card: ',
                        Strings.toString(tokenId),
                        '", "description": "OnChain NFTs created with Thirdweb!", "image": "data:image/svg+xml;base64,',
                        Base64.encode(bytes(output)),
                        '"}'
                    )
                )
            )
        );

        output = string(
            abi.encodePacked("data:application/json;base64,", json)
        );

        return output;
    }

    // 3 helper function - easily get the random words
    function getBlockchain(
        uint256 tokenId
    ) public view returns (string memory) {
        return pluck(tokenId, "Blockchains", blockchains);
    }

    function getDapp(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "Dapps", dapps);
    }

    function getToken(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "Tokens", tokens);
    }

    // claim function - to actually clain and mint the Nft
    function claim(uint256 _amount) public {
        require(_amount > 0 && _amount < 6);
        _safeMint(msg.sender, _amount);
    }
}
