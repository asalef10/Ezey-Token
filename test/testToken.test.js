const Token = artifacts.require("Token");
const TokenFactory = artifacts.require("TokenFactory");

contract("Token", async (accounts) => {
  let TokenInstance, TokenFactoryInstance, ownerAddress;

  before(async () => {
    TokenFactoryInstance = await TokenFactory.deployed();

    await TokenFactoryInstance.createToken();

    let addressContract = await TokenFactoryInstance.getTokenAddress();
    TokenInstance = await Token.at(addressContract);
  });

  it("Should get owner address", async () => {
     ownerAddress = await TokenInstance.getOwner();
    console.log(ownerAddress);
    console.log(accounts);
  });
  it("Should get balance", async () => {
    let balanceERC20 = await TokenInstance.getBalance(ownerAddress);
    // console.log(JSON.stringify(balanceERC20));
    console.log(balanceERC20 + "bal");
  });
  it("Should transfer token", async () => {
    await TokenInstance.transferToken(accounts[1]);
    let balanceERC20 = await TokenInstance.getBalance(accounts[1]);
    assert.equal(balanceERC20, 500, "Balance amount need to be 500 eth");
    console.log(balanceERC20 + "bal");
  });
});
