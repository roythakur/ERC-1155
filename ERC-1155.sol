// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract HelloToken is ERC1155, Ownable {
uint256[] supplies  =[20, 40, 42];
 uint256[] minted = [0,0,0];
 uint256[] rates = [0.05 ether, 0.001 ether, 0.1 ether];

    constructor() ERC1155("") {}

    function mint( uint256 id, uint256 amount, bytes memory data)
        public
     
    {
 require(id<supplies.length, "Token does not exist");
         require(id>0, "Token does not exist");

uint index= id-1;

         require(minted[index]+amount<=supplies[index], "NO ENOUGH SUPPLY");
         require(msg.value>=amount*rates[index], "NO ENOUGH ETHERS");
         minted[index]+=amount;

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
