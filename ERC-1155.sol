// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract HelloToken is ERC1155, Ownable {
uint256[] supplies  =[20, 40, 42];

    constructor() ERC1155("") {}

    function mint( uint256 id, uint256 amount, bytes memory data)
        public
     
    {
 require(id<supplies.length, "Token does not exist");
         require(id>0, "Token does not exist");

        _mint(msg.sender, id, amount, data);
    }

  // for mint batch of tokens
    // function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
    //     public
    //     onlyOwner
    // {
    //     _mintBatch(to, ids, amounts, data);
    // }
}
