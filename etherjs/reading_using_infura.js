const {ethers} = require("ethers")

const provider = new ethers.providers.JsonRpcProvider(`{URL}`);


const getBlock = async()=>{
    // const block = await provider.getBlockNumber();
    // console.log("current block number is: ",block);

    const balance = await provider.getBalance("{ADDRESS}")
    console.log("account balance in BN is: " , balance);

    const balanceEther = ethers.utils.formatEther(balance);
    console.log("account balance in ether is: " , balanceEther);

    const balanceGue = ethers.utils.parseEther(balanceEther);
    console.log("account balance in GBG: " , balanceGue)


     
}

getBlock();
