var SmarcToken = artifacts.require("SmarcToken");
var LogiToken = artifacts.require("LogiToken");

module.exports = function(deployer) {
  deployer.deploy(SmarcToken, { gas: 10000000 });
  deployer.deploy(LogiToken, { gas: 10000000 });
};