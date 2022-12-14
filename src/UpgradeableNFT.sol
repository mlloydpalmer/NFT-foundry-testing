// SPDX-License-Identifier: UNLICENSED
import "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";


contract myNFT is ERC721Upgradeable {


    function initialize() initializer public {
        __ERC721_init("My NFT", "MNFT");
        
    }

}