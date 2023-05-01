const { ObjectId } = require('mongodb');
const mongoose = require('mongoose')

const sponsorSchema = new mongoose.Schema({
    amount: { type: Number, required: true },
    user: {
        type: ObjectId,
        ref: 'User',
        required: false
      },
    

  });
  
  const Sponsor = mongoose.model('Sponsor', sponsorSchema);
  
  module.exports = Sponsor;
  