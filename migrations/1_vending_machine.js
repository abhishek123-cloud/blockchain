const SimpleStorage = artifacts.require("SimpleStorage");
const SimpleToken = artifacts.require("SimpleToken");
const Voting = artifacts.require("Voting");

module.exports = function (deployer) {
    deployer.deploy(SimpleStorage, 100); // Deploy with an initial storage value of 100
    deployer.deploy(SimpleToken, 1000);  // Deploy with an initial token supply of 1000
    deployer.deploy(Voting);             // Deploy the voting contract
};