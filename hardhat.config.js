require("@nomiclabs/hardhat-waffle");
require('dotenv').config();

module.exports = {
  solidity: "0.8.0",
  networks:{
    rinkeby: {
      url: process.env.RINKEBY_API,
      accounts: [`0x${process.env.PRIVATE_KEY}`]
    }
  }
};
