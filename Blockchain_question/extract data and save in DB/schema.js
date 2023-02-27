const mongoose = require('mongoose');

const blockSchema = mongoose.Schema({
    hashValue: {
        type: String,
    },

    parentHashValue: {
        type: String,
    },

    blockNumber: {
        type: Number,
    },
    timeStamp: {
        type: Number,
    },

    minerValue: {
        type: String,
    },
})


const BlockModel = mongoose.model('BlockModel', blockSchema);
module.exports = BlockModel;
