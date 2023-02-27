const ethers = require('ethers')
const express = require('express')
const mongoose = require('mongoose')
const dotenv = require('dotenv')
const app = express();
const BlockModel = require('./schema')
app.use(express.json());
dotenv.config()

const provider = new ethers.providers.JsonRpcProvider(process.env.INFURA_URL);

mongoose.connect(process.env.MONGO_URL, { useNewUrlParser: true, useUnifiedTopology: true })
    .then(() => {
        console.log("connected succesfully")
    })
    .catch((err) => {
        console.log(err);
    });

const getInfo = async () => {

    const block = await provider.getBlock(100006);
    return block
}
app.get('/', async (req, res) => {
    try {
        const blockData = await getInfo();
        console.log(blockData)
        const newBlock = new BlockModel({
            hashValue: blockData.hash,
            parentHashValue: blockData.parentHash,
            blockNumber: blockData.number,
            timeStamp: blockData.timestamp,
            minerValue: blockData.miner
        });
        await newBlock.save();
        res.status(200);
        res.send("added")
        console.log("succesfully added");
    }
    catch (err) {
        console.log(err)
    }

})

app.listen(3000, () => {
    console.log("app is listening on xyz port")
})
