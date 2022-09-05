// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Token.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TokenFactory{
  address owner;

    mapping(address=>address)public tokenAddress;

   constructor(){
     owner = msg.sender;
}
    function createToken()external returns(address token){
        token = address(new Token());
        tokenAddress[msg.sender] = token;
    }
    function getOwner()public view returns(address) {
        return owner;
    }
    function getTokenAddress()public view returns(address){
      return tokenAddress[msg.sender];
    }
}