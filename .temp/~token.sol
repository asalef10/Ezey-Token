// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/~IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/~ERC20.sol";

contract Token is ERC20 {
address owner;
// uint256 balance;


    constructor () ERC20("Token A","A"){
        owner = msg.sender;
        _mint(address(this), 10 * (10 ** uint256(decimals())));
        mint();
    }
    
    function mint() public returns (bool) {
        _mint( msg.sender, 100000000000 );
        return true;
    }
    function getBalance(address balanceAddress)public view returns(uint256 balance){
        return  IERC20(address(this)).balanceOf(balanceAddress);
    }

    function transferToken(address accountTransfer)public{
         IERC20(address(this)).transfer(accountTransfer,500);
    }

    function getOwner()public view returns(address){
    return owner;
    }
}