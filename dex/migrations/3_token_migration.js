const Link = artifacts.require("Link");
const Dex = artifacts.require("Dex");

module.exports = async function (deployer, network, accounts) {
  await deployer.deploy(Link);
  // for test like what we write in the console truffle.Everytime wheen it was deployed it will be done.
  let dex = await Dex.deployed();
  let link = await Link.deployed();
  await link.approve(dex.address, 500);
  await dex.addToken(web3.utils.fromUtf8("LINK"), link.address);
  await dex.deposit(100, web3.utils.fromUtf8("LINK"));
  let balanceOfLink = await dex.balances(
    accounts[0],
    web3.utils.fromUtf8("LINK")
  );
  console.log(balanceOfLink);
};
