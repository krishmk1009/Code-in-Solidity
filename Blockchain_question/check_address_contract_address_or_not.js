// Write a Solidity function to check if a given address is a contract or not.
const ethers = require('ethers')
const dotenv = require('dotenv')
dotenv.config()
const provider = new ethers.providers.JsonRpcProvider(process.env.INFURA_URL);


const fun = async () => {
    const address = '0xdAC17F958D2ee523a2206206994597C13D831ec7'
    const value = await provider.getCode(address);
    if (value != '0x') console.log("correct");
    else {
        console.log("false");
    }
}

fun()
