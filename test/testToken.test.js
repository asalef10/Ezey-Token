const Token = artifacts.require("Token");
const TokenFactory = artifacts.require("TokenFactory");

contract("Token", async (accounts) => {
  let TokenInstance, TokenFactoryInstance, ownerAddress;

  before(async () => {
    TokenFactoryInstance = await TokenFactory.deployed();

    await TokenFactoryInstance.createToken("TokenA", "A");

    let addressContract = await TokenFactoryInstance.getTokenAddress("TokenA");
    TokenInstance = await Token.at(addressContract);
  });

  it("Should get owner address", async () => {
    ownerAddress = await TokenInstance.getOwner();
    console.log(ownerAddress);
  });
  it("Should get balance", async () => {
    let balanceERC20 = await TokenInstance.getBalance(ownerAddress);
    console.log(balanceERC20 + " balance");
  });
  it("Should transfer token", async () => {
    await TokenInstance.transferToken(accounts[1]);
    let balanceERC20 = await TokenInstance.getBalance(accounts[1]);
    assert.equal(balanceERC20, 500, "Balance amount need to be 500 eth");
    console.log(balanceERC20 + " balance");
  });
});
