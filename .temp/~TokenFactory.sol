// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./~Token.sol";
import "@openzeppelin/contracts/token/ERC20/~IERC20.sol";

contract TokenFactory{
  address owner;

  mapping(address=> mapping( string => address))internal  tokenAddress;

  struct addressList {
    address addressContract;
    string nameToken;
    string symbolToken;
  }


   constructor(){
     owner = msg.sender;
}
    function createToken(string memory nameToken,string memory symbolToken)external returns(address token){
        token = address(new Token(nameToken,symbolToken));
        tokenAddress[msg.sender][nameToken] = token;
    }
    function getOwner()external view returns(address) {
        return owner;
    }
    function getTokenAddress(string memory nameToken)external view returns(address addressContract){
      return addressContract =  tokenAddress[msg.sender][nameToken];
    }
}