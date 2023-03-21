const { ethers } = require("ethers")

const provider = new ethers.providers.JsonRpcProvider(`https://mainnet.infura.io/v3/e15f901714b945e292c3607159b5348f`);


const calculateGas = async () => {

    const endTimeStamp = 1679381649;
    const startTimeStamp = 1679381100;
    const timeStep = 60; // Step size in seconds

    let gasValue= ethers.BigNumber.from(0);
    let transCount= ethers.BigNumber.from(0);
    let count = 0;
    for (let t = startTimeStamp; t <= endTimeStamp; t += timeStep) {
        const blockNumber = await provider.getBlockNumber(t);
        const currentBlock = await provider.getBlock(blockNumber);
       
        const currentGas = currentBlock.baseFeePerGas;
        const blockTrasaaction = currentBlock.transactions.length;


        gasValue = gasValue.add(blockTrasaaction*currentGas);
        transCount = transCount.add(blockTrasaaction);

    }

    const avgPrice = gasValue.div(transCount);
    console.log(avgPrice.toString())

}

calculateGas();
